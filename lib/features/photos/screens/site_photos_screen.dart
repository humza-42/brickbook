import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../providers/photo_providers.dart';
import '../data/models/photo_models.dart';

class SitePhotosScreen extends ConsumerStatefulWidget {
  final String projectId;
  const SitePhotosScreen({super.key, required this.projectId});

  @override
  ConsumerState<SitePhotosScreen> createState() => _SitePhotosScreenState();
}

class _SitePhotosScreenState extends ConsumerState<SitePhotosScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndUploadImage() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1080,
    );

    if (picked != null && mounted) {
      final captionController = TextEditingController();
      String? selectedCategory;
      const categories = ['progress', 'safety', 'material', 'team', 'site'];

      String _cap(String s) => s[0].toUpperCase() + s.substring(1);

      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Upload Photo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: captionController,
                decoration: const InputDecoration(
                  labelText: 'Caption (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: categories
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(_cap(c)),
                        ))
                    .toList(),
                onChanged: (v) => selectedCategory = v,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await ref.read(photoUploadNotifierProvider.notifier).uploadPhoto(
                      imageFile: picked,
                      caption: captionController.text.trim(),
                      category: selectedCategory,
                    );
                if (mounted && ref.read(photoUploadNotifierProvider).uploadedPhoto != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Photo uploaded')),
                  );
                }
              },
              child: const Text('Upload'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final photosAsync = ref.watch(photosListProvider(projectId: widget.projectId, category: null));
    final viewMode = ref.watch(photoViewModeNotifierProvider);
    final filter = ref.watch(photoFilterProvider);
    final uploadState = ref.watch(photoUploadNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Site Photos'),
        actions: [
          SegmentedButton<PhotoViewMode>(
            segments: const [
              ButtonSegment(
                value: PhotoViewMode.grid(),
                icon: Icon(Icons.grid_view_outlined),
                label: Text('Grid'),
              ),
              ButtonSegment(
                value: PhotoViewMode.timeline(),
                icon: Icon(Icons.timeline_outlined),
                label: Text('Timeline'),
              ),
            ],
            selected: {viewMode},
            onSelectionChanged: (sel) {
              final mode = sel.first;
              if (mode is PhotoViewModeGrid) {
                ref.read(photoViewModeNotifierProvider.notifier).setGrid();
              } else {
                ref.read(photoViewModeNotifierProvider.notifier).setTimeline();
              }
            },
          ),
          PopupMenuButton<String>(
            onSelected: (val) {
              ref.read(photoFilterProvider.notifier).set(val == 'all' ? null : val);
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'all', child: Text('All Categories')),
              const PopupMenuItem(value: 'progress', child: Text('Progress')),
              const PopupMenuItem(value: 'safety', child: Text('Safety')),
              const PopupMenuItem(value: 'material', child: Text('Material')),
              const PopupMenuItem(value: 'team', child: Text('Team')),
              const PopupMenuItem(value: 'site', child: Text('Site')),
            ],
          ),
        ],
      ),
      body: photosAsync.when(
        data: (photos) {
          var displayPhotos = photos;
          if (filter != null) {
            displayPhotos = photos.where((p) => p.category == filter).toList();
          }

          if (displayPhotos.isEmpty) {
            return _EmptyPhotos(filter: filter);
          }

          if (viewMode is PhotoViewModeGrid) {
            return _PhotoGrid(photos: displayPhotos);
          } else {
            return _PhotoTimeline(photos: displayPhotos);
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (uploadState.isUploading)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      value: uploadState.progress / 100.0,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Uploading ${uploadState.progress}%',
                      style: AppText.caption),
                ]),
              ),
            ),
          FloatingActionButton.extended(
            onPressed: _pickAndUploadImage,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            icon: const Icon(Icons.add_photo_alternate_outlined),
            label: const Text('Add Photo'),
          ),
        ],
      ),
    );
  }
}

class _PhotoGrid extends StatelessWidget {
  final List<SitePhoto> photos;
  const _PhotoGrid({required this.photos});

  @override
  Widget build(BuildContext context) {
    // Sort by takenAt desc
    final sorted = [...photos]..sort((a, b) => b.takenAt.compareTo(a.takenAt));

    return GridView.builder(
      padding: const EdgeInsets.all(AppDim.sm),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: sorted.length,
      itemBuilder: (_, i) {
        final photo = sorted[i];
        return GestureDetector(
          onTap: () => _openFullscreen(context, sorted, i),
          child: Hero(
            tag: 'photo_${photo.id}',
            child: CachedNetworkImage(
              imageUrl: photo.thumbnailUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                color: AppColors.surfaceVariant,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (_, __, ___) => Container(
                color: AppColors.surfaceVariant,
                child: const Icon(Icons.broken_image_outlined, color: AppColors.textTertiary),
              ),
            ),
          ),
        );
      },
    );
  }

  void _openFullscreen(BuildContext context, List<SitePhoto> photos, int initialIndex) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => _FullscreenPhotoViewer(
          photos: photos,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class _PhotoTimeline extends StatelessWidget {
  final List<SitePhoto> photos;
  const _PhotoTimeline({required this.photos});

  @override
  Widget build(BuildContext context) {
    // Group by date
    final grouped = <String, List<SitePhoto>>{};
    for (final p in photos) {
      final dateKey = '${p.takenAt.year}-${p.takenAt.month}-${p.takenAt.day}';
      grouped.putIfAbsent(dateKey, () => []).add(p);
    }

    final sortedDates = grouped.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      padding: const EdgeInsets.all(AppDim.sm),
      itemCount: sortedDates.length,
      itemBuilder: (_, i) {
        final dateKey = sortedDates[i];
        final datePhotos = grouped[dateKey]!;
        final date = datePhotos.first.takenAt;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDim.md),
              child: Text(
                '${date.day} ${_monthAbbr(date.month)} ${date.year}',
                style: AppText.labelLg.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ...datePhotos.map((photo) => _TimelinePhotoCard(photo: photo)),
            const SizedBox(height: AppDim.md),
          ],
        );
      },
    );
  }

  String _monthAbbr(int m) => ['Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'][m - 1];
}

class _TimelinePhotoCard extends StatelessWidget {
  final SitePhoto photo;
  const _TimelinePhotoCard({required this.photo});

  Color _categoryColor(String category) {
    switch (category) {
      case 'progress': return AppColors.primary;
      case 'safety': return AppColors.error;
      case 'material': return AppColors.catMaterials;
      case 'team': return AppColors.catProfession;
      case 'site': return AppColors.catSiteSetup;
      default: return AppColors.accent;
    }
  }

  String _cap(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: () => _openFullscreen(context, [photo], 0),
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppDim.base),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDim.radiusMd),
                child: CachedNetworkImage(
                  imageUrl: photo.thumbnailUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    width: 80,
                    height: 80,
                    color: AppColors.surfaceVariant,
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    width: 80,
                    height: 80,
                    color: AppColors.surfaceVariant,
                    child: const Icon(Icons.broken_image_outlined, color: AppColors.textTertiary),
                  ),
                ),
              ),
              const SizedBox(width: AppDim.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (photo.caption != null) ...[
                      Text(photo.caption!, style: AppText.bodyMd),
                      const SizedBox(height: 4),
                    ],
                    Row(
                      children: [
                        if (photo.category != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: _categoryColor(photo.category!).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppDim.radiusFull),
                            ),
                            child: Text(
                              _cap(photo.category!),
                              style: AppText.caption.copyWith(
                                color: _categoryColor(photo.category!),
                                fontSize: 10,
                              ),
                            ),
                          ),
                        if (photo.projectName != null) ...[
                          const SizedBox(width: 6),
                          Text(photo.projectName!, style: AppText.caption),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${photo.takenAt.day} ${_monthAbbr(photo.takenAt.month)} '
                      '${photo.takenAt.hour}:${photo.takenAt.minute.toString().padLeft(2, '0')}',
                      style: AppText.caption.copyWith(color: AppColors.textTertiary),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }

  String _monthAbbr(int m) => ['Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'][m - 1];

  void _openFullscreen(BuildContext context, List<SitePhoto> photos, int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => _FullscreenPhotoViewer(
          photos: photos,
          initialIndex: index,
        ),
      ),
    );
  }
}

class _FullscreenPhotoViewer extends StatefulWidget {
  final List<SitePhoto> photos;
  final int initialIndex;
  const _FullscreenPhotoViewer({required this.photos, required this.initialIndex});

  @override
  State<_FullscreenPhotoViewer> createState() => _FullscreenPhotoViewerState();
}

class _FullscreenPhotoViewerState extends State<_FullscreenPhotoViewer> {
  late PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('${_currentIndex + 1} / ${widget.photos.length}'),
      ),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemCount: widget.photos.length,
        itemBuilder: (_, i) {
          final photo = widget.photos[i];
          return Center(
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: photo.url,
                fit: BoxFit.contain,
                placeholder: (_, __) => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.broken_image_outlined,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _sharePhoto(context, widget.photos[_currentIndex]),
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.share_outlined, color: Colors.white),
      ),
    );
  }

  void _sharePhoto(BuildContext context, SitePhoto photo) {
    // Implement share functionality using share_plus if needed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share feature coming soon')),
    );
  }
}

class _EmptyPhotos extends StatelessWidget {
  final String? filter;
  const _EmptyPhotos({this.filter});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('📸', style: const TextStyle(fontSize: 52)),
        const SizedBox(height: 16),
        Text(
          filter != null ? 'No photos in this category' : 'No site photos yet',
          style: AppText.h3,
        ),
        const SizedBox(height: 8),
        Text(
          filter != null
              ? 'Try a different category filter'
              : 'Capture progress, safety issues,\nmaterials, and team moments.',
          textAlign: TextAlign.center,
          style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
        ),
        if (filter == null) ...[
          const SizedBox(height: AppDim.xl),
          ElevatedButton.icon(
            onPressed: () => context.push('/photos'), // will trigger FAB
            icon: const Icon(Icons.add_photo_alternate_outlined, size: 18),
            label: const Text('Add First Photo'),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, foregroundColor: Colors.white),
          ),
        ],
      ]),
    ),
  );
}

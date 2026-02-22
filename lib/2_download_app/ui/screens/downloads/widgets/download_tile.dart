import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  IconData getIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;
      case DownloadStatus.downloading:
        return Icons.downloading;
      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final res = controller.ressource;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${(controller.progress * 100).toStringAsFixed(1)} % completed - "
                      "${(res.size * controller.progress).toStringAsFixed(1)} of ${res.size} MB",
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: controller.progress,
                      minHeight: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: Icon(getIcon(controller.status)),
                onPressed: controller.status == DownloadStatus.notDownloaded
                    ? controller.startDownload
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}

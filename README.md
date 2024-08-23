
# SplitVideoByChapters

**SplitVideoByChapters.sh** is a Bash script designed to split a video file into separate segments based on chapter markers. This is particularly useful for creating individual files for each chapter of a video, making it easier to manage and navigate content.

## Features

- **Automatic Splitting**: Automatically splits the video based on chapter markers embedded in the file.
- **Flexible Format Support**: Works with various video formats supported by `ffmpeg`.
- **Easy to Use**: Simple command-line interface.

## Requirements

- **ffmpeg**: The script relies on `ffmpeg` to handle video processing. Ensure `ffmpeg` is installed on your system.

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/therishitakerr/SplitVideoByChapters.git
   ```

2. Navigate to the script directory:

   ```sh
   cd SplitVideoByChapters
   ```

3. Make the script executable:

   ```sh
   chmod +x SplitVideoByChapters.sh
   ```

## Usage

To use the script, run the following command:

```sh
./SplitVideoByChapters.sh <input_video> <output_directory>
```

### Parameters

- `<input_video>`: Path to the input video file that contains chapter markers.
- `<output_directory>`: Directory where the split video files will be saved. The directory will be created if it does not exist.

### Example

```sh
./SplitVideoByChapters.sh myvideo.mp4 ./output
```

This command will split `myvideo.mp4` into multiple segments based on chapter markers and save them in the `./output` directory.

## Notes

- Ensure the input video file has chapter markers. If not, the script may not work as intended.
- The script assumes the input file has chapters embedded in it. For videos without chapters, you might need to add them manually or use another tool to create them.

## Troubleshooting

- **ffmpeg not found**: Ensure `ffmpeg` is installed and accessible in your system's PATH.
- **Script errors**: Make sure you have permission to execute the script and that the input file and output directory paths are correct.

## Contributing

If you find any issues or want to contribute to the development of this script, please open an issue or submit a pull request on the [GitHub repository](https://github.com/therishitakerr/SplitVideoByChapters).

class Video {
  final String image;
  final String title;
  final String genre;
  final String language;
  final int noOfEpisodes;
  final int noOfSeasons;

  Video({
    this.image,
    this.title,
    this.genre,
    this.language,
    this.noOfEpisodes,
    this.noOfSeasons,
  });
}

class VideoClip {
  final String thumbnail;
  final String time;

  VideoClip(this.thumbnail, this.time);
}

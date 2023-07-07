<template>
  <div>
  <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="(video, index) in videos1" :key="index">
          <div class="grid-content">
              <div>
                  <iframe :src="video.url" scrolling="no" border="3" frameborder="0" allowfullscreen="true"
                      allow="autoplay; fullscreen" style="width: 100%; height: 100%; border-radius: 10px;"></iframe>
                  <div class="video-title">{{ video.title }}</div>
              </div>
          </div>
      </el-col>
  </el-row>
  <br><br>
  <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="(video, index) in videos2" :key="index">
          <div class="grid-content">
              <div>
                  <iframe :src="video.url" scrolling="no" border="0" frameborder="0" allowfullscreen="true"
                      allow="autoplay; fullscreen" style="width: 100%; height: 100%; border-radius: 10px;"></iframe>
                  <div class="video-title">{{ video.title }}</div>
              </div>
          </div>
      </el-col>
  </el-row>
  <br><br>
  <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="(video, index) in videos3" :key="index">
          <div class="grid-content">
              <div>
                  <iframe :src="video.url" scrolling="no" border="0" frameborder="0" allowfullscreen="true"
                      allow="autoplay; fullscreen" style="width: 100%; height: 100%; border-radius: 10px;"></iframe>
                  <div class="video-title">{{ video.title }}</div>
              </div>
          </div>
      </el-col>
  </el-row>
  </div>
</template>

<script>
export default {
  name: 'YourComponentName',
  data() {
      return {
    
          videos1: [
              {
                  title: ' 零基础学游泳十步曲',
                  url: "//player.bilibili.com/player.html?aid=796610269&bvid=BV1TC4y187eM&cid=218982843&page=1",
              },
              {
                  title: ' 零基础教你6步学会蛙泳',
                  url: "//player.bilibili.com/player.html?aid=739295725&bvid=BV15k4y1i7hg&cid=1074605617&page=1",
              },
              {
                  title: ' 游泳初学者的第一课',
                  url: "//player.bilibili.com/player.html?aid=770923949&bvid=BV1Dr4y1E76G&cid=774249161&page=1",
              }
          ],
          videos2: [
              {
                  title: ' 这样练腹才有效，不伤腰',
                  url: "//player.bilibili.com/player.html?aid=477274912&bvid=BV1iK41127jT&cid=952518846&page=1",
              },
              {
                  title: ' 加入这个技巧，背肌突飞猛进',
                  url: "//player.bilibili.com/player.html?aid=902404364&bvid=BV1sP4y127y7&cid=886188978&page=1",
              },
              {
                  title: ' 自由泳入门教程',
                  url: "//player.bilibili.com/player.html?aid=16404880&bvid=BV1bx411L7sA&cid=26764835&page=1",
              }
          ],
          videos3: [
              {
                  title: ' 踩水基础水性、踩水的训练方法',
                  url: "//player.bilibili.com/player.html?aid=770923949&bvid=BV1Dr4y1E76G&cid=774249161&page=1",
              },
              {
                  title: ' 搞懂自由泳、仰泳和蝶泳的腿部动作',
                  url: "//player.bilibili.com/player.html?aid=291063501&bvid=BV1Nf4y1874K&cid=352188940&page=1",
              },
              {
                  title: ' 加入这个技巧，背肌突飞猛进',
                  url: "//player.bilibili.com/player.html?aid=721376564&bvid=BV1yQ4y1q78D&cid=436718934&page=1",
              }
          ]
      };
  },
};
</script>


<style scoped>
.grid-content {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.video-title {
  margin-top: 10px;
}
</style>

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
                  title: '一对哑铃练全身，20分钟增肌减脂',
                  url: "//player.bilibili.com/player.html?aid=657754964&bvid=BV1Ea4y1c7B2&cid=1178976028&page=1",
              },
              {
                  title: ' 这样做俯卧撑，才能更快的练大胸肌',
                  url: "//player.bilibili.com/player.html?aid=229770842&bvid=BV1rh411T7H6&cid=1164685863&page=1",
              },
              {
                  title: ' 告别细弱，增粗手臂，撑爆袖管',
                  url: "//player.bilibili.com/player.html?aid=698570731&bvid=BV1dm4y1h7zG&cid=1128095058&page=1",
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
                  title: ' 暑期15分钟，高效跳绳燃脂',
                  url: "//player.bilibili.com/player.html?aid=685388997&bvid=BV1BU4y1Q7Z4&cid=760051568&page=1",
              }
          ],
          videos3: [
              {
                  title: ' 5个步骤，提高俯卧撑数量和动作质量',
                  url: "//player.bilibili.com/player.html?aid=933563283&bvid=BV17T4y1o7mj&cid=424908014&page=1",
              },
              {
                  title: ' 腹肌增强变明显，零场地无器械',
                  url: '//player.bilibili.com/player.html?aid=335893423&bvid=BV1qR4y1n7Lm&cid=419473769&page=1',
              },
              {
                  title: ' 最全初阶战绳训练，膝盖友好',
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

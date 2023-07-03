<template>
    <div class="container">
      <div class="profile">
        <img class="avatar" src="path_to_avatar_image" alt="Avatar">
        
        <div class="profile-info">
          <h2>{{ nickname }}</h2>
          <p>{{ account }}</p>
          <p>{{ bio }}</p>
        </div>
      </div>
<hr>
      <div class="user-stats">
        <div class="points">
          <h3>积分</h3>
          <p>{{ points }}</p>
        </div>
        <div class="title">
          <h3>头衔</h3>
          <p>{{ title }}</p>
        </div>
      </div>
<hr>
      <div class="favorites">
        <h2>收藏的视频</h2>
        <!-- 在这里展示用户收藏的视频 -->
      </div>
      <form @submit.prevent="saveAvatar">
      <input type="file" accept="image/*" @change="handleFileChange">
      <button type="submit">保存头像</button>
    </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        nickname: "kevin",
        account: "3056063115@qq.com",
        bio: "武汉大学计算机学院2021级软件工程系本科生",
        points: 1000,
        title: "高级会员",
        // 可以在这里添加用户收藏的视频数据
      };
    },
  };
  </script>
  
  <style>

  .profile img {
  margin-right: 50px; /* 或者根据需要设置合适的数值 */
}

  .container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
  }
  
  .profile {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-right: 20px;
  }
  
  .profile-info {
    display: flex;
    flex-direction: column;
  }
  
  .user-stats {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
  }
  
  .points,
  .title {
    text-align: center;
  }
  
  .favorites {
    margin-top: 40px;
  }
  
  /* 可根据需要自定义样式 */
  </style>
  
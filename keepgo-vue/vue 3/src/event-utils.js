let eventGuid = 0;
let today = new Date();
let todayStr = today.toISOString().replace(/T.*$/, '');

export const INITIAL_EVENTS = [
  {
    id: createEventId(),
    title: '晨练1h',
    start: todayStr
  },
  {
    id: createEventId(),
    title: '长跑5km',
    start: todayStr
  },
  {
    id: createEventId(),
    title: '游泳2h',
    start: getDateString(-1)
  },
  {
    id: createEventId(),
    title: '慢跑2km',
    start: getDateString(1) 
  },
  {
    id: createEventId(),
    title: '瑜伽1h',
    start: getDateString(3)
  },
  {
    id: createEventId(),
    title: '健身视频学习',
    start: getDateString(4)
  },
  {
    id: createEventId(),
    title: '增肌训练1h',
    start: getDateString(-3)
  },
  {
    id: createEventId(),
    title: '耐力训练1h',
    start: getDateString(6)
  }
];

export function createEventId() {
  return String(eventGuid++);
}

function getDateString(dayOffset) {
  const targetDate = new Date();
  targetDate.setDate(today.getDate() + dayOffset);
  return targetDate.toISOString().replace(/T.*$/, '');
}


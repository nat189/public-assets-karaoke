var links = Array.from(document.querySelectorAll('img, a'))
    .map(el => el.src || el.href)
    .filter(url => url && url.toLowerCase().includes('.jpg')) // หาเฉพาะไฟล์ .jpg
    .map(url => url.replace(/-\d+x\d+(?=\.jpg)/i, '')); // ลบตัวเลขย่อขนาด เช่น -1024x576 ออกจากชื่อไฟล์

// กรองลิงก์ซ้ำ และแสดงผลเป็น JSON
console.log(JSON.stringify([...new Set(links)], null, 2));

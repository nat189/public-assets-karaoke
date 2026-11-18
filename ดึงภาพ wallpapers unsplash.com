var links = Array.from(document.querySelectorAll('img'))
    .map(img => img.src)
    .filter(url => url && url.includes('images.unsplash.com/photo-')) // ดึงเฉพาะรูปที่เป็นภาพถ่าย
    .map(url => {
        let baseUrl = url.split('?')[0]; // ตัดค่าพารามิเตอร์เดิมทิ้ง
        return baseUrl + '?q=80&w=1920&auto=format&fit=crop'; // บังคับให้เป็นขนาด 1920x1080 คุณภาพ 80%
    });

console.log(JSON.stringify([...new Set(links)], null, 2));

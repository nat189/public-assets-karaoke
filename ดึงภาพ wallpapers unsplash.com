var links = Array.from(document.querySelectorAll('img'))
    .filter(img => img.src && img.src.includes('images.unsplash.com/photo-')) // หาเฉพาะภาพถ่ายจาก Unsplash
    .filter(img => img.naturalWidth > img.naturalHeight) // **คัดเฉพาะภาพต้นฉบับที่เป็น "แนวนอน" เท่านั้น**
    .map(img => {
        let baseUrl = img.src.split('?')[0]; 
        // ปรับขนาดให้เป็น Full HD 1080P เป๊ะๆ
        return baseUrl + '?w=1920&h=1080&fit=crop&q=80&auto=format'; 
    });

// กรองลิงก์ซ้ำ และคายผลลัพธ์ออกมาเป็น JSON
console.log(JSON.stringify([...new Set(links)], null, 2));

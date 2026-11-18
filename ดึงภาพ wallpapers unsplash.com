var links = Array.from(document.querySelectorAll('img'))
    .map(img => img.src)
    .filter(url => url && url.includes('images.unsplash.com/photo-')) 
    .map(url => {
        let baseUrl = url.split('?')[0]; 
        // บังคับกว้าง 1920 สูง 1080 และตัดส่วนเกินออก (fit=crop)
        return baseUrl + '?w=1920&h=1080&fit=crop&q=80&auto=format'; 
    });

console.log(JSON.stringify([...new Set(links)], null, 2));

import * as fs from 'fs';

function main(input: string): void {
    const lines = input.trim().split('\n');
    
    // ここに問題の解法を実装
    
    // 例: 最初の行を数値として読み取る
    const n = parseInt(lines[0]);
    
    // 例: スペース区切りの数値を配列として読み取る
    // const numbers = lines[1].split(' ').map(x => parseInt(x));
    
    console.log(n);
}

if (require.main === module) {
    const input = fs.readFileSync('/dev/stdin', 'utf8');
    main(input);
}
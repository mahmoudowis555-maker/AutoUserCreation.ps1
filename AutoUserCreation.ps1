# Automated Local User Onboarding Script
# Created by: Mahmoud Owis

# 1. تحديد مسار ملف البيانات
$csvPath = "C:\IT_Scripts\NewUsers.csv"
$users = Import-Csv -Path $csvPath

# 2. اللف على كل موظف في الملف عشان نكريت الأكونت بتاعه
foreach ($user in $users) {
    $username = $user.Username
    $fullName = $user.FullName
    $group = $user.Group
    
    # تحويل الباسورد لصيغة مشفرة عشان الويندوز يقبلها
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    try {
        # 3. التأكد إن اليوزر مش موجود أصلاً عشان منعملش إيرور
        if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
            Write-Host "User $username already exists! Skipping..." -ForegroundColor Yellow
        } else {
            # 4. إنشاء اليوزر الجديد
            New-LocalUser -Name $username -FullName $fullName -Password $password -Description "Created via Automation Script" | Out-Null
            
            # 5. إضافة اليوزر للجروب (زي Users أو Administrators)
            Add-LocalGroupMember -Group $group -Member $username
            
            # طباعة رسالة نجاح باللون الأخضر
            Write-Host "Successfully created user: $username and added to $group group." -ForegroundColor Green
        }
    }
    catch {
        # طباعة رسالة خطأ باللون الأحمر لو حصلت مشكلة
        Write-Host "Failed to create user $username. Error: $_" -ForegroundColor Red
    }
}
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.5115.1589918237038147126
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2020 12:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jpaJvgUm;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id u7so362862vsp.7
        for <docs@lists.yoctoproject.org>; Tue, 19 May 2020 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3BjiloPGDdJAqb7NaWFDNVuzi/9boEgQxCMzwId/GE=;
        b=jpaJvgUmE+zpjDPF06BgBvWa6dn7olPBOywolrrLGzvbWj5TBvTMsVoAeoSgWImyH8
         HISf51f9wWAmBHJAFPO/qSyxoKegwYgspM5Z8w959vLNsQ/2CCwcHxcRKoAG5kmLOplB
         GkgylZ9WX8/KtlJ2Ns+ofPiPcsrw9IFRmvBJccRcWVinGa0OLwPhT7be8p6AWKHEKzDI
         7E++BF7Jqrwra6kDVBOymRBKN+iC2RgbAtB2ynYyKwp7oUJKfE3YU08vderfPJPRNJSY
         eIqaIS6yZRATyVuarV2Rx21vwzAjs9FuPm+ySvUtRCN/QXwYYZdLknH7INDBPfRLXrEx
         u/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3BjiloPGDdJAqb7NaWFDNVuzi/9boEgQxCMzwId/GE=;
        b=Mv8O+zQb6v8sESJ+xguUcA0VmB+cXJnQ6WFU4V/92JkU6ChNN2otmQQiAPcZqYw7oU
         4sp7nrSxH3TNQbbBuQRoTgcu5KoItMDIECUS+pFAp1BX8kxW7ZC0yFU010E6hcJecncB
         tABCiNI491rX9H7mS111dnYIUJgU4eNfNPFAka5UzU2h8SOtlOWxJXUkImuBeH6i8wAx
         fOOAOAevoJNtBMFV8PqtvXoLSoX/1CFUTid1oVv+u/2uwreVPSQXmrtKya0DwRGJKErg
         ZX8n6FkX3W9efuScfe+NDqKb2j7OtKdkiyIgneFvyf5DJr0WeUkDqfmaFS3blZyTEngR
         wSNA==
X-Gm-Message-State: AOAM5327bFUo+e+L8Z9VnXLXdLo9B5nzFzJbu+PDQqf1PkpwQB7bJihA
	t1P9w40GJBKzZUzFVy8WVPDoYPBCBXFL3hR3z2s=
X-Google-Smtp-Source: ABdhPJynduaKDvP9Gwo2/y0CYVx7gTy1Db4yL7Zr0CM5H3hcXtgIhjMZPmMSxYrIcmpLiY5kDluAytsMv8v+ZjUWQLs=
X-Received: by 2002:a67:df86:: with SMTP id x6mr738434vsk.94.1589918236227;
 Tue, 19 May 2020 12:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200519173141.20686-1-akuster808@gmail.com> <CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com>
 <61851e6c-8c86-f0db-4af0-06b4616570e2@gmail.com>
In-Reply-To: <61851e6c-8c86-f0db-4af0-06b4616570e2@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 19 May 2020 21:57:04 +0200
Message-ID: <CANNYZj_v2+JVgZPuQWPn0=70-NuVoe6o0ay7OOdWonffUe3+7w@mail.gmail.com>
Subject: Re: [docs] [PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
To: akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b1432805a605af6b"

--000000000000b1432805a605af6b
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2020 at 21:15, akuster808 <akuster808@gmail.com> wrote:

> Also, the equivalents for other distributions should be added,
> specifically packages which contain dri.pc pkg-config file.
>
>
> Sounds like a great idea. I will wait for someone to send those package
> names.
>

Ubuntu/Debian: mesa-common-dev
Fedora/Centos: mesa-libGL-devel

Alex

--000000000000b1432805a605af6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 19 May 2020 at 21:15, akuster808 =
&lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
 =20
   =20
 =20
  <div>Also, the equivalents for other distributions should be
          added, specifically packages which contain dri.pc pkg-config
          file.<blockquote type=3D"cite"><div dir=3D"ltr">
      </div>
    </blockquote>
    <br>
    Sounds like a great idea. I will wait for someone to send those
    package names.<br></div></blockquote><div><br></div><div>Ubuntu/Debian:=
 mesa-common-dev <br></div><div>Fedora/Centos: mesa-libGL-devel</div><div><=
br></div><div>Alex<br></div><div><br></div><div><br></div><div><br></div></=
div></div>

--000000000000b1432805a605af6b--

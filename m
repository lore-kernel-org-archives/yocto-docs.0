Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.4317.1589915700466381614
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2020 12:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nlv3Z6ya;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id m7so283300plt.5
        for <docs@lists.yoctoproject.org>; Tue, 19 May 2020 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=V6OCGQQTt6pkgRIUFeImpV0Txr+dQ8o8g8XzwKwtYB0=;
        b=Nlv3Z6yak5cx/v/KEfixgNYF4lJwrBQMpRWxVSHsC/naKLlP4E3DX5gNjeYjyN9lUO
         rkjfw899GtE1UEo3b/1Lm72THD/Pmx/0oxvR3OaJDUcJudT0D9t8EtHK6RXNK55vW7zR
         G3hSwpLxZVaE6fdcPlqXZu9qeVzQoMyD97qCKTHn7jI0xIecwJZBEoZbNFu/Gw8uzwlw
         7pUT56qsWS5wMVHdvq6Nw+J543E4rvbHklAljrtAQ+6eXhjwTjTxgkZeXcmwydFCp90C
         7hgYMVgh6AmuUIaATL9ZCLEUoMfwlGcWi9rN9x+cyGgXOJHuxw9ksVmcyuBEHhpsJ7CV
         xSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=V6OCGQQTt6pkgRIUFeImpV0Txr+dQ8o8g8XzwKwtYB0=;
        b=aap7SxKEegMsk1mq9JR4iyie5sei3cKXIMlzfbU2SFVaW5P92iVPsflMKOhvZ9WqA8
         nxNoQJD3YYmiTr96gXjyKr0ER0S8I+gB/ICisx/gxMaX7Wbv5n5pXawTILuVnix+IyM9
         lg9cb1v6etcsSEGngHuAnmoFjhYG1ezwKLwncHw0eMaMoLsCVOFLuNpaqMAEAEBEmlhb
         Su1h8y0myNxVMh1NvNWpBw9zDX+mNEHO7YD4Z2Ao2g1/+YiFw1FCP2ZTCpoml5jdrGYe
         Mb0qP33i/Lpk3yWtlg9OaG54b5iMkQonJtqIJBTca6vUbqMhkGeaa2k2n7XXh1ewYoBd
         Ek4Q==
X-Gm-Message-State: AOAM533QUk1z8ZqSuJTk/IhtkRcm1dzyM0lsIjWgwDxXIb2w06/yi6go
	hMgUcRfPI1SYHc/iEnlCXtOG2s7G
X-Google-Smtp-Source: ABdhPJys5rmuiQMYEWUOGiMdw9BKUkhixWQFvq6LdQX2b1Sh8MTgilMZlj1O8wE4K+xnz/eU8alKqQ==
X-Received: by 2002:a17:90a:6a0f:: with SMTP id t15mr1053903pjj.121.1589915699611;
        Tue, 19 May 2020 12:14:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9de6:6921:ec78:716d? ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id s13sm211221pfh.118.2020.05.19.12.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 12:14:58 -0700 (PDT)
Subject: Re: [docs] [PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20200519173141.20686-1-akuster808@gmail.com>
 <CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <61851e6c-8c86-f0db-4af0-06b4616570e2@gmail.com>
Date: Tue, 19 May 2020 12:14:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------375C1E2AF99CB191EC8807E6"
Content-Language: en-US

--------------375C1E2AF99CB191EC8807E6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 5/19/20 12:04 PM, Alexander Kanavin wrote:
> Should be capitalized: Mesa-dri-devel.

Ah, didn't realized. will send V2.

>
> Also, the equivalents for other distributions should be added,
> specifically packages which contain dri.pc pkg-config file.

Sounds like a great idea. I will wait for someone to send those package
names.

- armin
>
> Alex
>
> On Tue, 19 May 2020 at 19:31, akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      documentation/poky.ent | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/documentation/poky.ent b/documentation/poky.ent
>     index a54793911a..fd8c335868 100755
>     --- a/documentation/poky.ent
>     +++ b/documentation/poky.ent
>     @@ -70,7 +70,7 @@
>           python3-jinja2 SDL-devel xterm rpcgen">
>      <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git
>     chrpath make wget python-xml \
>           diffstat makeinfo python-curses patch socat python3
>     python3-curses tar python3-pip \
>     -     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
>     libSDL-devel xterm rpcgen
>     +     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
>     libSDL-devel xterm rpcgen mesa-dri-devel
>           $ sudo pip3 install GitPython">
>      <!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
>           $ sudo yum makecache
>     -- 
>     2.17.1
>
>     
>


--------------375C1E2AF99CB191EC8807E6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/19/20 12:04 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Should be capitalized: Mesa-dri-devel.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Ah, didn't realized. will send V2.<br>
    <br>
    <blockquote type="cite"
cite="mid:CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Also, the equivalents for other distributions should be
          added, specifically packages which contain dri.pc pkg-config
          file.</div>
      </div>
    </blockquote>
    <br>
    Sounds like a great idea. I will wait for someone to send those
    package names.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, 19 May 2020 at 19:31,
          akuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:
          Armin Kuster &lt;<a href="mailto:akuster808@gmail.com"
            target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
          ---<br>
           documentation/poky.ent | 2 +-<br>
           1 file changed, 1 insertion(+), 1 deletion(-)<br>
          <br>
          diff --git a/documentation/poky.ent b/documentation/poky.ent<br>
          index a54793911a..fd8c335868 100755<br>
          --- a/documentation/poky.ent<br>
          +++ b/documentation/poky.ent<br>
          @@ -70,7 +70,7 @@<br>
                python3-jinja2 SDL-devel xterm rpcgen"&gt;<br>
           &lt;!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc
          gcc-c++ git chrpath make wget python-xml \<br>
                diffstat makeinfo python-curses patch socat python3
          python3-curses tar python3-pip \<br>
          -     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
          libSDL-devel xterm rpcgen<br>
          +     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
          libSDL-devel xterm rpcgen mesa-dri-devel<br>
                $ sudo pip3 install GitPython"&gt;<br>
           &lt;!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release<br>
                $ sudo yum makecache<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------375C1E2AF99CB191EC8807E6--

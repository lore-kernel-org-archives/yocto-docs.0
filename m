Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.12834.1589981949984950571
 for <docs@lists.yoctoproject.org>;
 Wed, 20 May 2020 06:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLQ8K3J3;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id y18so1564318pfl.9
        for <docs@lists.yoctoproject.org>; Wed, 20 May 2020 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=4C0USRYS/lk7DvWG5cG+HZjZgRJ9oI3GtjZOEELiVUA=;
        b=hLQ8K3J3LL1yqMq0DhtUaKp3LBECZwqn8TO+ukRIyN+W1EWRjwDpl7diEArMY/wpk1
         vk8CWCZhYbjqGXRrneAgysgZismhKe5gYipaacbh3WvHHNRzR4H22Vzg0yAeCsgzesZG
         dh2QIvFeWHE2cyxkEDRDR75vZBCH3sRsI/EufOXdoH3tiXIxUdbd3RXfyhQ4Fh6gxe4R
         zeOSu9RhZGqCgE/4kf6o6J8M0jg8ZIOJOkVVCOhKUBGPWCnMqSPJ15tn5pRd8l21oX5i
         3K7I+e6VN2pApTE75ziPXOjcjrs4AH0GX4htBlrOV7MNQ0y4hw8F6VEp0Vxeq2qIorpN
         LL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=4C0USRYS/lk7DvWG5cG+HZjZgRJ9oI3GtjZOEELiVUA=;
        b=lZMHiTtp5lH/og2VlNfV9C42FNQQcOXHFfaLPSuWxzk6qbWO0rEdG+mirheBax1szX
         VJuB6ipczsqYMdmwbIlHorXWPHAuoRs5dR3yk4lR3Zf384LQsm3tLaNql5337rEY/h0Q
         GOq7FJ+CJxWZT8gESoZYst/PkkENqgUCNDFUdvNvcUU9dbpopxChadOh1OmHD6Uye5Nc
         HIhG5xGdFfeQ0OPHqs0RE1WKPfnnsdU4hS4nGvp2RDxIwnSFCePjwBkbqVO79EgLDgw/
         EMwxmPBeRCcjMdFB1dhhCl9hO4QkHWdZQstJlBmfUSSq4z1MHF6fjVzMlieawqpjAmj6
         kcqg==
X-Gm-Message-State: AOAM532fj3UyVXWFYsegOuJkmhrLhyBO/mffTbLfcUKGp2gYy+pfz77J
	+ju9U3xYdEy66X1BdQGwtAVMal2G
X-Google-Smtp-Source: ABdhPJxLpz73CTLZ4whey8QFwR3n44yaiNaPWRCdnNRE+9dOHz3U1BzZEDPN9VIx6tUhXlNG0gcX1A==
X-Received: by 2002:a63:1854:: with SMTP id 20mr4271647pgy.257.1589981949246;
        Wed, 20 May 2020 06:39:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:89fe:2720:c4a0:6889? ([2601:202:4180:a5c0:89fe:2720:c4a0:6889])
        by smtp.gmail.com with ESMTPSA id h7sm1916242pgn.60.2020.05.20.06.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 06:39:08 -0700 (PDT)
Subject: Re: [docs] [V2][PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20200520042639.7077-1-akuster808@gmail.com>
 <CANNYZj8Hc0XNj3+xP4nZmoy27MhqSwQ9Of6ziDxVAFyhgLPMmg@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <854951c0-a149-f25b-7bc0-4c48a5ba6383@gmail.com>
Date: Wed, 20 May 2020 06:39:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Hc0XNj3+xP4nZmoy27MhqSwQ9Of6ziDxVAFyhgLPMmg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------C5F88D1C07F02E3391AD9386"
Content-Language: en-US

--------------C5F88D1C07F02E3391AD9386
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 5/20/20 1:09 AM, Alexander Kanavin wrote:
> This still is missing the entries for other distros which I sent?

sigh... I had the typo fixed queued up but then got distracted and never
looked in my inbox again before sending it much later.

thanks for the info. I will update accordingly.

-armin

>
> Alex
>
> On Wed 20. May 2020 at 6.26, akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     [v2]
>     Fix typo
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      documentation/poky.ent | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/documentation/poky.ent b/documentation/poky.ent
>     index a54793911a..07dc1af3d6 100755
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
>     libSDL-devel xterm rpcgen Mesa-dri-devel
>           $ sudo pip3 install GitPython">
>      <!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
>           $ sudo yum makecache
>     -- 
>     2.17.1
>
>     
>


--------------C5F88D1C07F02E3391AD9386
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/20/20 1:09 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8Hc0XNj3+xP4nZmoy27MhqSwQ9Of6ziDxVAFyhgLPMmg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>
        <div dir="auto">This still is missing the entries for other
          distros which I sent?</div>
      </div>
    </blockquote>
    <br>
    sigh... I had the typo fixed queued up but then got distracted and
    never looked in my inbox again before sending it much later.<br>
    <br>
    thanks for the info. I will update accordingly.<br>
    <br>
    -armin<br>
    <br>
    <blockquote type="cite"
cite="mid:CANNYZj8Hc0XNj3+xP4nZmoy27MhqSwQ9Of6ziDxVAFyhgLPMmg@mail.gmail.com">
      <div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Alex</div>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed 20. May 2020 at 6.26,
            akuster &lt;<a href="mailto:akuster808@gmail.com"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">[v2]<br>
            Fix typo<br>
            <br>
            Signed-off-by: Armin Kuster &lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
            ---<br>
             documentation/poky.ent | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/documentation/poky.ent b/documentation/poky.ent<br>
            index a54793911a..07dc1af3d6 100755<br>
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
            libSDL-devel xterm rpcgen Mesa-dri-devel<br>
                  $ sudo pip3 install GitPython"&gt;<br>
             &lt;!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y
            epel-release<br>
                  $ sudo yum makecache<br>
            -- <br>
            2.17.1<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------C5F88D1C07F02E3391AD9386--

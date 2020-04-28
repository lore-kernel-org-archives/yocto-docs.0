Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web12.765.1588106852165275940
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Apr 2020 13:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CBPyDaVO;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id d197so73050ybh.6
        for <docs@lists.yoctoproject.org>; Tue, 28 Apr 2020 13:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=fcu4NjofiK7TuqRIZ0YRnL+EqlAf+hqmyZbTtcPzwB4=;
        b=CBPyDaVO0CUr0hLJt0GO8SIqYZIDcGFowzVVIv9/NajIJUYjKq6oEXJZNXKQwp5E3C
         A2PAMsgAd+qXKMFJ7OiPV9UFUSxlKQOhkrv5z5GamyTIVlbi7gs8yfNrmgiNpayLw8cl
         ReND4Sxs67YZnX5JgWWGGtFQuaXMDDBSlFdQ0lVL2kjoPg/qU+0QiEmG3CyWWzd/xeHJ
         hCBO9HeB7rSZhnMDenA/rMpSrZsINgPvo9szSdy+jDPfLOkZe7q/jtdvXTfYzLGx5hSa
         5d2szqOTCfRPk/g16r+bxkhgrjnJAnrDQyHSblqrSHijhs/9xUJG/WQ+wiIRtbB/MmMC
         Azew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fcu4NjofiK7TuqRIZ0YRnL+EqlAf+hqmyZbTtcPzwB4=;
        b=m++wjgDIPcX/ddisiopcU9N/tjuo7tM8F0zYzgAm2cAkqCbG7Cd0tb7xwx87JP2pHY
         4Hd3RwGphCwHgqzX4IC7JCaCbXyc07cPTGE9SgJZL8I2Z3QAGtQv3W+/ZyfDjFZCkos5
         VkjXOf+uLW0kFQA8fPbh/ivTt05enUQXwaNwo91bi4TUd3AzpDX30Um5phQ0mPJ6ELjH
         VDF+L3nZQE5r8mnI7hzQO477V91W24Ogxf4Xor5/sIGljO6JzHrpZ/byKey/G6FDF+7U
         gIqyl2SXwYDvbEf4yB/Vi2jnHgTZBy66qpSAo0u3e1bMP0+ctkIkvzp6k54E8lt/3IwW
         LJmw==
X-Gm-Message-State: AGi0PubzrdJ3S45fOBYUDqYp7v9rQ0MgfaFCyx4x1WbDMVzr1RTpzdJS
	hLbvKhy/xPkjtZ8tuk7n/UGqKboXQxBiGHeieltJaHaL13DJVw==
X-Google-Smtp-Source: APiQypINl8OQFCBbnbRgdOwFp8/npVYV3XEDVBbr40JDjSATMfEd4cta/AFtQteJ7H6++5eo6mqECAy2AryaCArYTug=
X-Received: by 2002:a25:c695:: with SMTP id k143mr37361871ybf.397.1588106850990;
 Tue, 28 Apr 2020 13:47:30 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 28 Apr 2020 22:47:19 +0200
Message-ID: <CAP71WjwQiXmHKxjpRtJofo6ekyLOob9oABsYptj2=i9mmiqKoQ@mail.gmail.com>
Subject: inconsistencies between poky and yocto-docs trees
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b811cd05a45ff0e7"

--000000000000b811cd05a45ff0e7
Content-Type: text/plain; charset="UTF-8"

hi,

i just noticed that some documentation commits have made it to poky tree,
but they are not in yocto-docs tree.

The last 5 commits in yocto-docs:
$ git log --oneline -5
77e8a9e03 dev-manual: remove postinst false statement
dda137617 ref-manual: add migration section for 3.1
bc0923354 dev-manual: basic updates for npm fetcher changes
af9bf61a5 ref-manual: update PACKAGECONFIG glossary entry
d40485a7e overview-manual: fix obvious typo "ORHNAME"

The last 5 'doc' commits in yocto:
$ git log -5 --oneline  -- documentation/
f9e1127643 Updated patch for publishing
cd25abf777 Added usrmerge to distro-features for Bug 13494
fe25ef9871 ref-manual: correct "script" dirname to "scripts"
a44b8d2856 dev-manual: remove postinst false statement
c31ddaba1f ref-manual: add migration section for 3.1

The top 3 patches are missing in yocto-docs..

cheers

--000000000000b811cd05a45ff0e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi,</div><div><br></div><div>i just noticed that some=
 documentation commits have made it to poky tree, but they are not in yocto=
-docs tree. <br></div><div><br></div><div>The last 5 commits in yocto-docs:=
</div><div>$ git log --oneline -5<br>77e8a9e03 dev-manual: remove postinst =
false statement<br>dda137617 ref-manual: add migration section for 3.1<br>b=
c0923354 dev-manual: basic updates for npm fetcher changes<br>af9bf61a5 ref=
-manual: update PACKAGECONFIG glossary entry<br>d40485a7e overview-manual: =
fix obvious typo &quot;ORHNAME&quot;</div><div><br></div><div>The last 5 &#=
39;doc&#39; commits in yocto:</div><div>$ git log -5 --oneline =C2=A0-- doc=
umentation/<br>f9e1127643 Updated patch for publishing<br>cd25abf777 Added =
usrmerge to distro-features for Bug 13494<br>fe25ef9871 ref-manual: correct=
 &quot;script&quot; dirname to &quot;scripts&quot;<br>a44b8d2856 dev-manual=
: remove postinst false statement<br>c31ddaba1f ref-manual: add migration s=
ection for 3.1</div><div><br></div><div>The top 3 patches are missing in yo=
cto-docs.. <br></div><div><br></div><div>cheers<br></div></div>

--000000000000b811cd05a45ff0e7--

Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.497.1593027360155825291
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 12:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EOlIDUuj;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: twoerner@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id m21so2349008eds.13
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nwr/dqV6MBk2uH7+axLcEorzwtzsUydZSnstkfJNVo8=;
        b=EOlIDUujRSqhIX9BxNh8DH7tiA4PvxhzDqEzCcabQ2CiPArJXxbkazlVxKL4MS8XaC
         O9pxnhgnzLdlHgr8J8O8anpXuFnR7OCtsTrMmlm7HS/qIFtWT5XBst3JYCSEf4I8Eh4/
         oE14PumyFvgverYzgDDlP2mrL+psQx+DNM94W9DXAETjlMlVSo2eQexywdwt2F/C2+FG
         zKaKMiv0/vLETApxr2IlCT93QEBpl8sbP7pYXr9hy6G9iw37wWpMTLPRwUZuRZqdJK02
         huEcszzJ/b2Qy5ry2vNGYecfekk016ygCBAujuXC1FwThIhUNcjv4EQ8ZxGYkaMlkKZ6
         IIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nwr/dqV6MBk2uH7+axLcEorzwtzsUydZSnstkfJNVo8=;
        b=qfnrgLA4ozsUOz+TdllQe6AvwZd1a+CJgtHrE3EFaRsqTVOLtuBCzizbV0lIl650RO
         MPhoEntPWF9TKk1ILxDhdtMxmKowv0t9yUoVpF2RI0Q3M7IJHQybDL0hYGW4isDF31N2
         UUxQIDqfw7dDsEmzHTyfdar8x4E6bZp6GCuoffXDHEnWmkE92aWBcVjvwoRwuJxIGq0i
         zU5GuqiZivrqt4WVIVxB8aH/s7TZ8oQrNSxR5GbJOx2KBdggNXzNx9hxhTvlQRkbFRXL
         HaVf7eC+xYhL70sgUybAAU0IPnSY6rskKEK/o0QVwet06RUF4Qq2q7pTonUMMOZ9WcwH
         cVpQ==
X-Gm-Message-State: AOAM530V0e74XmwdlmWE3skmFoCN2swNjPd3wtExgj8e+HT5r/9twPbq
	bWWBuls3QwOtqDo6pgHVqLUkUliGR8RgO5q4L50=
X-Google-Smtp-Source: ABdhPJxNJFyY5TDmFv5d/vthC+1zpzFCemIsTeF4fnb9/QX3xwqX51AQf8zWHl6a5+aoyFEonu80JNHmXjcIC38SBMg=
X-Received: by 2002:a05:6402:1558:: with SMTP id p24mr27904885edx.193.1593027358534;
 Wed, 24 Jun 2020 12:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200616211450.8079-1-mark.morton@windriver.com>
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org> <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Wed, 24 Jun 2020 15:35:45 -0400
Message-ID: <CAHUNapR1azgOund7LtARa-N8mAzm-5H7fnv2==gfNS2yGagq8w@mail.gmail.com>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
To: Mark Morton <Mark.Morton@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d2afdd05a8d995b8"

--000000000000d2afdd05a8d995b8
Content-Type: text/plain; charset="UTF-8"

Building the new test-manual for pdf doesn't succeed for me. But that could
indicate something wrong on my end.
A relevant snip is below, I'm not sure what the most important parts are.

$ cd yocto-docs/documentation
$ make pdf DOC=test-manual

cd test-manual; ../tools/poky-docbook-to-pdf test-manual.xml ../template;
cd ..
Note: namesp. cut : stripped namespace before processing
            Yocto Project Test Environment Manual

Making portrait pages on A4 paper (210mmx297mm)
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
XLink to nonexistent id:
...
SEVERE: javax.xml.transform.TransformerException:
file:/opt/oe/layers/master/yocto-docs/documentation/test-manual/test-manual.fo:442:178:
Property ID "test-yocto-project-autobuilder-overview" (found on "fo:block")
previously used; ID values must be unique within a document! (See position
442:178)
Jun 24, 2020 3:32:48 PM FOP startFOP
SEVERE: Exception
org.apache.fop.apps.FOPException: org.apache.fop.fo.ValidationException:
file:/opt/oe/layers/master/yocto-docs/documentation/test-manual/test-manual.fo:442:178:
Property ID "test-yocto-project-autobuilder-overview" (found on "fo:block")
previously used; ID values must be unique within a document! (See position
442:178)
javax.xml.transform.TransformerException:
org.apache.fop.fo.ValidationException:
file:/opt/oe/layers/master/yocto-docs/documentation/test-manual/test-manual.fo:442:178:
Property ID "test-yocto-project-autobuilder-overview" (found on "fo:block")
previously used; ID values must be unique within a document! (See position
442:178)

--000000000000d2afdd05a8d995b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Building the new test-manual for pdf doesn&#39;t succeed f=
or me. But that could indicate something wrong on my end.<div>A relevant sn=
ip is below, I&#39;m not sure what the most important parts are.<br><div><b=
r></div><div>$ cd yocto-docs/documentation</div><div>$ make pdf DOC=3Dtest-=
manual</div><div><br></div><div>cd test-manual; ../tools/poky-docbook-to-pd=
f test-manual.xml ../template; cd ..<br>Note: namesp. cut : stripped namesp=
ace before processing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Yocto Project Test Environment Manual<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 <br>Making portrait pages on A4 paper (210mmx297mm)<b=
r>XLink to nonexistent id: <br>XLink to nonexistent id: <br>XLink to nonexi=
stent id: <br>XLink to nonexistent id: <br>XLink to nonexistent id: <br>XLi=
nk to nonexistent id: <br>XLink to nonexistent id: <br>XLink to nonexistent=
 id: <br>XLink to nonexistent id: <br>XLink to nonexistent id: <br>XLink to=
 nonexistent id:=C2=A0</div><div>...</div><div>SEVERE: javax.xml.transform.=
TransformerException: file:/opt/oe/layers/master/yocto-docs/documentation/t=
est-manual/test-manual.fo:442:178: Property ID &quot;test-yocto-project-aut=
obuilder-overview&quot; (found on &quot;fo:block&quot;) previously used; ID=
 values must be unique within a document! (See position 442:178)<br></div><=
div>Jun 24, 2020 3:32:48 PM FOP startFOP<br>SEVERE: Exception<br>org.apache=
.fop.apps.FOPException: org.apache.fop.fo.ValidationException: file:/opt/oe=
/layers/master/yocto-docs/documentation/test-manual/test-manual.fo:442:178:=
 Property ID &quot;test-yocto-project-autobuilder-overview&quot; (found on =
&quot;fo:block&quot;) previously used; ID values must be unique within a do=
cument! (See position 442:178)<br>javax.xml.transform.TransformerException:=
 org.apache.fop.fo.ValidationException: file:/opt/oe/layers/master/yocto-do=
cs/documentation/test-manual/test-manual.fo:442:178: Property ID &quot;test=
-yocto-project-autobuilder-overview&quot; (found on &quot;fo:block&quot;) p=
reviously used; ID values must be unique within a document! (See position 4=
42:178)<br></div></div></div>

--000000000000d2afdd05a8d995b8--

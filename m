Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.39.1599775416533476973
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Sep 2020 15:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Zqy4UBl4;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id s19so48743ybc.5
        for <docs@lists.yoctoproject.org>; Thu, 10 Sep 2020 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=keYwjKvc7FJGmYEEl/A3U+gMsStxEu6jiPSEI/djdew=;
        b=Zqy4UBl4fxAJG7OdBY+BFxn98+zO327LXhFIcwdDOjEre2YqJpRaQYqMI+TBYnRP0o
         PLFCPKqBUtZQ829nYlGZ3hBIDcyr7zPqgUArnEhEz8M9HQkeKGQIwNXMJ2RDwl4RZeFQ
         gkkE8vY9ZBmdImA59vbjC57mTURcdU5A5bSQsTHN9Pg1Xq7CLjmlfDPGbk1b45UUOgsm
         eUhc4W71tjfGoHe0goGyepxUGaVke3ZgENOWwQQ3hDO+Ps7+gXhPg6BOalWRqUKBen7y
         8idVSjEjyUURQ/kTi5+vrxx6J01vOAtOy07pQcr5zEWpRPJAQSaDzBRsBLZ4O5Lw+Oxd
         WfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=keYwjKvc7FJGmYEEl/A3U+gMsStxEu6jiPSEI/djdew=;
        b=t5scdyh2SpO7706RTsTKkbEIjEYAVMnmXnfIpcu+F1jt/Y7Znm48STwImRXIB4RwY4
         dzvYtcpy8Pvtl/egz5rvl1f8tWD6RX64xWVSxJZdnZrZZuVjJ7ygKbCvrXsc2OvPf0RH
         NY7HQWnPFKIh3hP2BJb+Jg1Zixu/ael+g7VU4p/pyQr2DBKamfOyDiev5ZY8RLRVoDe4
         CpZLuuIsbBKf2F6aRjH4qVZOLFhG3M8F0LhjtbViwQKfiPcss2G2p9RIIiizWnsnyXuq
         1gxf/G9f+Ez6ywv2rv5gT5ynpQ+2/zpoXDhJssUYUFyLqRzNDYfG6xXzm8ceP7DY/Xsq
         1dJA==
X-Gm-Message-State: AOAM53356nW9bQ6wqF/eGKQNKWhQELDsbqKWEqeGFq/cRKyatHcJ73gK
	HrdMjm1z8jw5zpKCYwPQUnCeiFnatlUa2Di6zT4tPN/rICDsLQ==
X-Google-Smtp-Source: ABdhPJz5u+dmk6IhxfLjm9l06UI48lcA2nZ6YsKB5zIyLou0BI0+/oauXhKKt/vIpoSA8dNsGG6T8w1utZo2DMyPDs0=
X-Received: by 2002:a25:c004:: with SMTP id c4mr16831332ybf.475.1599775415206;
 Thu, 10 Sep 2020 15:03:35 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 11 Sep 2020 00:03:24 +0200
Message-ID: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
Subject: [sphinx] updates as of Sep 10th.
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005827bd05aefcbd63"

--0000000000005827bd05aefcbd63
Content-Type: text/plain; charset="UTF-8"

hi there,

some more updates on our Sphinx migration task. It turned out to be a
rather huge task.. "Never ask engineers to make estimates" applies quite
well here ;)

I think we are getting close to where we wanted to be. As you should know
by now, we are planning to switch for 3.2, and the sphinx migration is kind
of blocking M3 right now. Richard and I have spent quite a bit of time on
the docs lately to make the final push.

Any help in this last mile would be much appreciated.. The 'last mile' is
to review each doc and finalize what's left which was not converted
properly by pandoc, nor by any of the regexp find/replace we've done..
Unfortunately this last step is manual and time consuming.

We are planning to merge the sphinx branch in yocto-docs and bitbake repo
any time now. We haven't removed the docbook files yet, we will do the
removal once we claim to be done.

In terms of publishing the docs, our plan is to have a brand new YP docs
'website'. On that website, we will publish docs for each release/branch,
and it will be easy to navigate between versions.

We have also created 'transition' pages in Sphinx for docs from all YP
releases from 0.9 to 3.1.x. For each release, we have a 'static' page with
links to the DocBook HTML manuals. So that the YP docs website will be the
*only* place to look for our docs moving forward.

In each of the 2 sphinx branches, we've done the following:
1. add makefile / sphinx boilerplate
2. used pandoc to convert all .xml into .rst. it's a gross conversion.. far
from perfect...
3. added a bunch of commits to fix up what's left from the conversion
(images, links, ..)
4. Finally we are doing a manual review of each file and fixing the last
things. At this point, what's the most painful is that the 'code-block'
sections are not converted automatically.

If anybody has any cycle now, we need to finish #4. The current status is
that:
* brief-yoctoprojectqs/* is done.
* bitbake user manual is half done, and I am doing it
* bsp-guide/*: i started it, and will finish
* ref-manual/*: RP is on it.
* there are plenty of warnings when we build, i would like to get rid of
them all!

Anything else is work that remains to be done. Before starting anything,
please send a quick email here to let everyone know, to avoid duplication.
If you have any improvement, please share your patches, I will take them
into the sphinx/master branch. And I will continue to work on the remaining
files that no one would pick.

And since a picture is worth a thousand words...

The new doc website is here:
https://docs.yoctoproject.org/

If you want to help, please review the "WIP" patches on
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=sphinx
And pick one of the manuals which are left! It is not straightforward to
get started, I have to warn you.. don't hesitate to ask me questions by
email or on irc (ndec) if you need any help.

And as a reminder, instructions to build can be found here:
https://wiki.yoctoproject.org/wiki/Documentation_Sphinx

cheers
nico

--0000000000005827bd05aefcbd63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi there,<br><div><br></div><div>some more updates on our =
Sphinx migration task. It turned out to be a rather huge task.. &quot;Never=
 ask engineers to make estimates&quot; applies quite well here ;)</div><div=
><br></div><div>I think we are getting close to where we wanted to be. As y=
ou should know by now, we are planning to switch for 3.2, and the sphinx mi=
gration is kind of blocking M3 right now. Richard and I have spent quite a =
bit of time on the docs lately to make the final push.</div><div><br></div>=
<div>Any help in this last mile would be much appreciated.. The &#39;last m=
ile&#39; is to review each doc and finalize what&#39;s left which was not c=
onverted properly by pandoc, nor by any of the=C2=A0regexp find/replace we&=
#39;ve done.. Unfortunately this last step is manual and time consuming.</d=
iv><div><br></div><div>We are planning to merge the sphinx branch in yocto-=
docs and bitbake repo any time now. We haven&#39;t removed the docbook file=
s yet, we will do the removal once we claim to be done.</div><div><br></div=
><div>In terms of publishing the docs, our plan is to have a brand new YP d=
ocs &#39;website&#39;. On that website, we will publish docs for each relea=
se/branch, and it will be easy to navigate between versions.=C2=A0</div><di=
v><br></div><div>We have also created &#39;transition&#39; pages in Sphinx =
for docs from all YP releases from 0.9 to 3.1.x. For each release, we have =
a &#39;static&#39; page with links to the DocBook HTML manuals. So that the=
 YP docs website will be the *only* place to look for our docs moving forwa=
rd.</div><div><br></div><div>In each of the 2 sphinx branches, we&#39;ve do=
ne the following:</div><div>1. add makefile / sphinx boilerplate</div><div>=
2. used pandoc to convert all .xml into .rst. it&#39;s a gross conversion..=
 far from perfect...</div><div>3. added a bunch of commits to fix up what&#=
39;s left from the conversion (images, links, ..)</div><div>4. Finally we a=
re doing a manual review of each file and fixing the last things. At this p=
oint, what&#39;s the most painful is that the &#39;code-block&#39; sections=
 are not converted automatically.</div><div><br></div><div>If anybody has a=
ny cycle now, we need to finish #4. The current status is that:</div><div>*=
=C2=A0brief-yoctoprojectqs/* is done.</div><div></div><div>* bitbake user m=
anual is half done, and I am doing it</div><div>* bsp-guide/*: i started it=
, and will finish</div><div>* ref-manual/*: RP is on it.</div><div>* there =
are=C2=A0plenty of warnings when we build, i would like to get rid of them =
all!</div><div><br></div><div>Anything else is work that remains to be done=
. Before starting anything, please send a quick email here to let everyone =
know, to avoid duplication. If you have any improvement, please share your =
patches, I will take them into the sphinx/master branch. And I will continu=
e to work on the remaining files that no one=C2=A0would pick.</div><div><br=
></div><div>And since a picture is worth a thousand words...</div><div><br>=
</div><div>The new doc website is here:</div><div><a href=3D"https://docs.y=
octoproject.org/">https://docs.yoctoproject.org/</a><br></div><div><div><br=
></div><div>If you want to help, please review the &quot;WIP&quot; patches =
on=C2=A0</div><div><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yo=
cto-docs/log/?h=3Dsphinx">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-=
docs/log/?h=3Dsphinx</a><br></div><div>And pick one of the manuals which ar=
e left! It is not straightforward to get started, I have to warn you.. don&=
#39;t hesitate to ask me questions by email or on irc (ndec) if you need an=
y help.</div><div></div></div><div><br></div><div>And as a reminder, instru=
ctions to build can be found here:</div><div><a href=3D"https://wiki.yoctop=
roject.org/wiki/Documentation_Sphinx">https://wiki.yoctoproject.org/wiki/Do=
cumentation_Sphinx</a></div><div><br></div><div>cheers</div><div>nico</div>=
<div><br></div><div>=C2=A0<br></div></div>

--0000000000005827bd05aefcbd63--

Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web12.655.1596664459477946912
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 14:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nMor4czh;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id u43so11326352ybi.11
        for <docs@lists.yoctoproject.org>; Wed, 05 Aug 2020 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=F4FKBdnMZsEaeXXw+wHX95nnKcHvesTr/GjfXxuaByU=;
        b=nMor4czhL3BivkmrSMoD+VxFTgdovpNosiuzp3guN46E9ew4uowuYwfiHK8T+8x8eA
         fQi0pyJTAO/0vcN6lAb1i1qGM78RQEfA5pnEheruDQFrI5oVVDuVE4AGdiLkyM5yAS/b
         6mQcfapGmP2pW8igvb7XyX1dua911oZu0BUTbAtsBcJonwtlFc1JQW94trjyz+MgDa3f
         dAHIWFgIXYbhJiVLE32t6b787Gw8MWcqG51VxngUVRTAuUUK0+RIoRz8Ix3Yjy3igFkp
         rqWNQXI+A19e84doYA5gkVMp2abB3EQCliTvwVg/0hLZ207v/WrV3gr9PAJwhNbRkqX7
         ejfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=F4FKBdnMZsEaeXXw+wHX95nnKcHvesTr/GjfXxuaByU=;
        b=cQgT5MHwStBHhjSlhWrXI+04FVZHUQ0f//0s6NA/wEY8AsSoPTlsoC31BejRseYkaw
         4tJERd5H6gw8WbC/nc8F6zoGK+YiYim7UAQ3h6XuPmit8uBMgxMSP/iy7BrcQJO1anYd
         ckm0Syo3A+8yPRvhUt6hxVEE7w4ueyE0TuKW3RHFcP+Zw4XpZcVBUCOJf5SBz1N5x1zZ
         UuIcUg6tphDN0RzVQB6Hm0D5bDPNe6nJ7w4x1HoPUO8PP20k8kfaAIfbUJ5qlRTtKZgb
         VjfJ3Seeec3WVBWV24/IFd9or/8QZuNLJ6CWMzhkU1KO7PH0TA4t9p53VEI3+VV/j1qo
         h/vQ==
X-Gm-Message-State: AOAM532HX01btDq6/NtxJ9kwNQKCeXSgm3rwijiikB7CEBopqQ8GniFM
	Z9e+VITABVGYVSmw7yf8YIfa2YhkCWtI2Fvf2ElOhjU+FwxxCA==
X-Google-Smtp-Source: ABdhPJyCMTKkbwp9mezzSZeBs1oFPUtFCJMV4/zEQUOX2VMOZ0jLUgBNMXSUjw/bk739Z44dUA2Jgm4c6hKYwtwzjiA=
X-Received: by 2002:a5b:451:: with SMTP id s17mr7837770ybp.454.1596664458184;
 Wed, 05 Aug 2020 14:54:18 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 5 Aug 2020 23:54:06 +0200
Message-ID: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
Subject: [sphinx] updates as of Aug 5th.
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hi there,

I will be away from the Interweb the next two weeks. So I wanted to
share some updates about how the YP docs migration to Sphinx is doing.
[it is a fairly long email].

To be honest, I wouldn't mind a little bit of help, and I will give
some hints about how you can help!

We are still working on publishing the current Sphinx docs on
yoctoproject.org, in the meantime, it's here for YP and Bitbake
documentation.

https://people.linaro.org/~nicolas.dechesne/yp-docs/html/index.html
https://people.linaro.org/~nicolas.dechesne/bitbake-docs/html/

All changes are pushed to the 'sphinx' branch in yocto-docs and in
bitbake trees.

Summary of the recent changes:

* I imported some CSS config from the current YP documentation, as a
result the look and feel is much closer to what we currently have.
There are still things to improve, but it's better on my eyes at
least.
* I added all images/figures, since they were missed by the automatic
conversion.
* I added a general index (it's a builtin Sphinx feature), which uses
all terms from the glossary. It is a nice feature, which looks
promising (it's a general index across all documents)
* I fixed a large amount to cross references (~2200 instances) to
terms and sections using a series of Python regexp and also another
400 instances were fixed manually.. when my regexp failed.
* I added extlinks Sphinx support to refer to external links/website,
and fixed them up in the source tree.
* I added intersphinx support which allows a Sphinx documentation
project to refer to section, terms, references from another Sphinx
documentation project. This is really good, since we can cross
reference bitbake terms directly from the YP documentation, eg..
:term:`bitbake:BB_FOO` will 'just work'.

The new documentation source code (.rst files) are really good to work
with, and it's much better to work with ReST files than XML, without
any surprise. The conversion is just a lot of work, and I already
spent some significant amount of work on it.. I hope you will find it
useful and I really hope it will achieve its goal to make it more
attractive to contribute to Yocto Project documentation project.

The way Sphinx works is that we have a single documentation project
that includes all the YP 'books'. It is an important change, we no
longer have X independent books, but have one project with all of
them. We need to work on how we want to publish the documentation
after the Sphinx migration.

Richard is trying to add support to easily switch between YP version
within the doc (e.g. like the Python doc), and we will host the 'old'
documentation as well. e.g. when choosing the 'thud' version, we want
to show a static page (not a Sphinx doc) that points to the thud html
doc.

And now here is the section you are all expecting the most! How can you help?

1. first you could learn about Sphinx and get familiar with the new
syntax. You should review all the patches one by one, to learn from
what I did! The sphinx documentation is good too. But looking at a
real world example is much easier.

2. there are still plenty of broken links.. it's mostly cross
references to section from one doc to another. DocBook used to have
'variables' (set in poky.ent) for each document (http link) and had
some macro to append an anchor to create a link. This whole mechanism
is not working well with Sphinx, and we should use Sphinx 'references'
(e.g. :ref: syntax) instead. Maybe some of that can be automated with
regexp, but I am not sure (very often it's multi line text and the
replacement pattern is not always obvious).. Just to give an idea
about how much work there is:
 $ git grep YOCTO_DOCS_.*_URL */*.rst  | wc -l
475

3. During the conversion from DocBook the 'code' or 'shell' sections
have been messed up, and is lost... it's quite unfortunate as this
will require some good amount of work to convert.. In Sphinx, we would
do this:
.. code-block:: shell
   $ cd $HOME/poky
   $ source oe-init-build-env
And it would render as we expect it to be.
This task is typically something that would distribute well among many
developers..

4. There are probably some other conversion hiccups at random places
(color, font type, text, ...), so I think we will have to do a careful
review of the HTML to find such issues and fix them. To be honest, I
think it's a rather good thing to do anyways

5. Theme or CSS improvements. We are using the standard 'read the doc'
theme. I would like to get feedback about the visual quality of the
resulting HTML project. If anyone has idea to improve it, that would
be much appreciated.

thanks!
nico

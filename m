Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.10208.1617813645442391021
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 09:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mbJIBQh9;
 spf=pass (domain: linaro.org, ip: 209.85.208.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f45.google.com with SMTP id h10so21634950edt.13
        for <docs@lists.yoctoproject.org>; Wed, 07 Apr 2021 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rFcE9xHzNjrAPGgzCEAFPycCdUTJorNkFwAQYLBAG8=;
        b=mbJIBQh9uCwuWODDx+Ubd6z3Kpoa4H9y8sdFlreykrhdvqbHEsDZGTZbEA2ATddH8Z
         xJp37MG8QRzk4W4GNk7uyfMI8IaYlacflB2VpyMBzkFlt17AI7IMfmxC2vYHkuUawIzw
         S/WcI1KkpA4f30CV67VBqWnx93rDP+gY7cU3WW4pTpEbfIx3o0CoTo5pf68f6/bIWUqQ
         r8OOKqHySFvVCxJog27L2DggEZbXIzqDQskzp6QvJ7YZWfM457mSeDYeAAWZyNZyHw8h
         lj8izvIF50y5N28KaVArIQDDGK7SY/NTNvCG+GT0nZkKm2YM693Di4gg0Op2S9wcH7EZ
         N5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rFcE9xHzNjrAPGgzCEAFPycCdUTJorNkFwAQYLBAG8=;
        b=RIdi3djxu5bhCcLuimjUZWQSaT2uJxxNFmEFCiO8LRF2lX7XjqmbZ+FyF1rgFDjLdy
         XKHaodud6epaeU5P3Uq9z/+4INd6xlDLNm2hE05d68MkxlvAntrbVQVcLWfs2ooECGr3
         P32SQWXRkJflp3k6QMPE0MBrE/2yVPW/MVmdGPF99XNQqaBDHw3kvjCsFubNpzJdjJaP
         9EFcuQGxu5o6iP8+M2eMF+SL5MhodaWGPPkVSR3PG5OIHB/1cGZ2JMuQAj9c2G9x3FFI
         XsplszR0Ub7MyUqEMnu4JPcUcTyM5aLOAHLdRKr4kuxtMoVkxDAnYVlPmKt5uJuPcqEL
         Td6Q==
X-Gm-Message-State: AOAM533TSBziXAB/SWTYvSzwMuoIl10aVCk5kobsb4uV0Sm5LO4BXXPy
	lsEpW5Y2l1PvrxSXsSV6qTl9uE71P+MMM87m1oWJ3A==
X-Google-Smtp-Source: ABdhPJx75z1q6eU4y23g3rFqI/LfAaDr/XxPPQMDcuRd5N7aXYSaXGr4gsXy5X9EXZpY6I0TSSQS+XsFKnL7PG9Is5E=
X-Received: by 2002:a05:6402:22f9:: with SMTP id dn25mr5570394edb.101.1617813643681;
 Wed, 07 Apr 2021 09:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
 <20210107165951.aqx4maful2uhopzx@qschulz> <CAP71WjyK679c8hjEE53PVyi-_8vX5TS6umsXk+y2TGio8c30hQ@mail.gmail.com>
 <CAP71WjxBRT6tbpgDroR0bKq2B0Nvr6pxuMe2nG+5MmGwyVo4VQ@mail.gmail.com> <20210407161247.p6jk2ow52scerzqa@qschulz>
In-Reply-To: <20210407161247.p6jk2ow52scerzqa@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 7 Apr 2021 18:40:32 +0200
Message-ID: <CAP71WjwzK4-zmPq0EZ0uAAgdMob9OBP6e6o6=FKNvb_DZ46ouw@mail.gmail.com>
Subject: Re: [docs] broken links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="0000000000008b776105bf6497e8"

--0000000000008b776105bf6497e8
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 6:12 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> On Wed, Jan 13, 2021 at 07:26:17PM +0100, Nicolas Dechesne wrote:
> > On Thu, Jan 7, 2021 at 6:08 PM Nicolas Dechesne <
> nicolas.dechesne@linaro.org>
> > wrote:
> >
> > >
> > >
> > > On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz <
> > > quentin.schulz@streamunlimited.com> wrote:
> > >
> > >> Hi Nicolas,
> > >>
> > >> On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:
> > >> > hey!
> > >> >
> > >> > Robert opened a bug for a broken link in the doc, see
> > >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168
> > >> >
> > >> > This is a valid bug, a regression in
> > >> > e1bcfe4d8 dev-manual: remove unused labels
> > >> >
> > >> > Unfortunately, it opens a can of worms... since it looks like the
> built
> > >> in
> > >> > linkcheck did not detect the broken links, and this is not the only
> > >> broken
> > >> > link.
> > >> >
> > >> > I ran an online link checker on
> > >> > https://docs.yoctoproject.org/dev-manual/common-tasks.html, and it
> > >> reported
> > >> > the following errors with anchors.. they look like they are
> regression
> > >> with
> > >> > the commit above..
> > >> >
> > >>
> > >> [...]
> > >>
> > >> It'd be nice to fix the linkcheck indeed.
> > >>
> > >
> > > hmm. could it be that linkcheck only checks for 'external' links?
> > >
> >
> > in the meantime I was looking for a tool I could run locally, and found
> [1]
> >
> > It looks like it gives some good output:
> >
> > $ pytest --check-links --check-anchors --check-links-cache
> > _build/html/dev-manual/
> >
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#new-recipe-autotooled-package>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#new-recipe-single-c-file-package-hello-world>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#new-recipe-patching-code>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#new-recipe-fetching-code>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#new-recipe-post-installation-scripts>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#new-recipe-storing-and-naming-the-recipe>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#usingpoky-extend-customimage>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#finding-the-temporary-source-code>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#understand-what-gives-your-image-size>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#combining-multiple-versions-library-files-into-one-image>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#using-a-provided-kickstart-file>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#wic-using-the-wic-plugin-interface>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> href=#wic-requirements>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#best-practices-to-follow-when-creating-layers>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#using-bbappend-files>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#incrementing-a-binary-package-version>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#automatically-incrementing-a-binary-package-revision-number>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#qemu-image-running-tests>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-debugging-viewing-logs-from-failed-tasks>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-debugging-viewing-variable-values>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-viewing-dependencies-between-recipes-and-tasks>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-viewing-task-variable-dependencies>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-debugging-taskrunning>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-debugging-bitbake>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-debugging-buildfile>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#platdev-gdb-remotedebug>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-other-debugging-others>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#dev-viewing-task-variable-dependencies>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#platdev-appdev-devshell>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#using-a-quilt-workflow>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#how-to-submit-a-change>
> > FAILED _build/html/dev-manual/common-tasks.html <a
> > href=#figuring-out-the-mailing-list-to-use>
> > FAILED _build/html/dev-manual/qemu.html <a
> > href=#qemu-running-under-a-network-file-system-nfs-server>
> > FAILED _build/html/dev-manual/qemu.html <a href=#kvm-cond>
> > FAILED _build/html/dev-manual/start.html <a href=
> > https://autobuilder.yocto.io//pub/nightly/>
> > FAILED _build/html/dev-manual/start.html <a href=
> > https://autobuilder.yocto.io//pub/nightly/>
> > FAILED _build/html/dev-manual/start.html <a
> > href=#checkout-out-by-tag-in-poky>
> >
> > It's slow, it took 7 minutes to check for the dev-manual.. but it's a
> first
> > step. now we need to fix them!
> >
> > [1] https://github.com/jupyterlab/pytest-check-links
> >
>
> In the end, I went for htmltest to test links:
> https://github.com/wjdp/htmltest
>
> ~5min for the whole documentation. Not too bad :)
>

Very interesting... It took 6min the first time, and I found 271 errors in
145 documents. Then I applied your last patch, and it took 3 seconds, since
it uses the local cache.. and found 190 errors. your patch looks nice too
;)
We should review that a bit more, but looks like something we want to add
in the AB, at least for the master-next builds..


>
> Cheers,
> Quentin
>

--0000000000008b776105bf6497e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 7, 2021 at 6:12 PM Quenti=
n Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.=
schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, Jan 13, 2021 at 07:26:17PM +0100, Nicolas=
 Dechesne wrote:<br>
&gt; On Thu, Jan 7, 2021 at 6:08 PM Nicolas Dechesne &lt;<a href=3D"mailto:=
nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org<=
/a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz &lt;<br>
&gt; &gt; <a href=3D"mailto:quentin.schulz@streamunlimited.com" target=3D"_=
blank">quentin.schulz@streamunlimited.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; Hi Nicolas,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wr=
ote:<br>
&gt; &gt;&gt; &gt; hey!<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Robert opened a bug for a broken link in the doc, see<br=
>
&gt; &gt;&gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D14168" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D14168</a><br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; This is a valid bug, a regression in<br>
&gt; &gt;&gt; &gt; e1bcfe4d8 dev-manual: remove unused labels<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Unfortunately, it opens a can of worms... since it looks=
 like the built<br>
&gt; &gt;&gt; in<br>
&gt; &gt;&gt; &gt; linkcheck did not detect the broken links, and this is n=
ot the only<br>
&gt; &gt;&gt; broken<br>
&gt; &gt;&gt; &gt; link.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I ran an online link checker on<br>
&gt; &gt;&gt; &gt; <a href=3D"https://docs.yoctoproject.org/dev-manual/comm=
on-tasks.html" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproje=
ct.org/dev-manual/common-tasks.html</a>, and it<br>
&gt; &gt;&gt; reported<br>
&gt; &gt;&gt; &gt; the following errors with anchors.. they look like they =
are regression<br>
&gt; &gt;&gt; with<br>
&gt; &gt;&gt; &gt; the commit above..<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [...]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It&#39;d be nice to fix the linkcheck indeed.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; hmm. could it be that linkcheck only checks for &#39;external&#39=
; links?<br>
&gt; &gt;<br>
&gt; <br>
&gt; in the meantime I was looking for a tool I could run locally, and foun=
d [1]<br>
&gt; <br>
&gt; It looks like it gives some good output:<br>
&gt; <br>
&gt; $ pytest --check-links --check-anchors --check-links-cache<br>
&gt; _build/html/dev-manual/<br>
&gt; <br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#new-recipe-autotooled-package&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#new-recipe-single-c-file-package-hello-world&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#new-recipe-patching-code&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#new-recipe-fetching-code&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#new-recipe-post-installation-scripts&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#new-recipe-storing-and-naming-the-recipe&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#usingpoky-extend-customimage&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#finding-the-temporary-source-code&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#understand-what-gives-your-image-size&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#combining-multiple-versions-library-files-into-one-image&gt;<b=
r>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#using-a-provided-kickstart-file&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#wic-using-the-wic-plugin-interface&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#wic-requ=
irements&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#best-practices-to-follow-when-creating-layers&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#using-bbappend-files&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#incrementing-a-binary-package-version&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#automatically-incrementing-a-binary-package-revision-number&gt=
;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#qemu-image-running-tests&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-debugging-viewing-logs-from-failed-tasks&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-debugging-viewing-variable-values&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-viewing-dependencies-between-recipes-and-tasks&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-viewing-task-variable-dependencies&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-debugging-taskrunning&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-debugging-bitbake&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-debugging-buildfile&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#platdev-gdb-remotedebug&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-other-debugging-others&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#dev-viewing-task-variable-dependencies&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#platdev-appdev-devshell&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#using-a-quilt-workflow&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#how-to-submit-a-change&gt;<br>
&gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; href=3D#figuring-out-the-mailing-list-to-use&gt;<br>
&gt; FAILED _build/html/dev-manual/qemu.html &lt;a<br>
&gt; href=3D#qemu-running-under-a-network-file-system-nfs-server&gt;<br>
&gt; FAILED _build/html/dev-manual/qemu.html &lt;a href=3D#kvm-cond&gt;<br>
&gt; FAILED _build/html/dev-manual/start.html &lt;a href=3D<br>
&gt; <a href=3D"https://autobuilder.yocto.io//pub/nightly/" rel=3D"noreferr=
er" target=3D"_blank">https://autobuilder.yocto.io//pub/nightly/</a>&gt;<br=
>
&gt; FAILED _build/html/dev-manual/start.html &lt;a href=3D<br>
&gt; <a href=3D"https://autobuilder.yocto.io//pub/nightly/" rel=3D"noreferr=
er" target=3D"_blank">https://autobuilder.yocto.io//pub/nightly/</a>&gt;<br=
>
&gt; FAILED _build/html/dev-manual/start.html &lt;a<br>
&gt; href=3D#checkout-out-by-tag-in-poky&gt;<br>
&gt; <br>
&gt; It&#39;s slow, it took 7 minutes to check for the dev-manual.. but it&=
#39;s a first<br>
&gt; step. now we need to fix them!<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/jupyterlab/pytest-check-links" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/jupyterlab/pytest-chec=
k-links</a><br>
&gt; <br>
<br>
In the end, I went for htmltest to test links:<br>
<a href=3D"https://github.com/wjdp/htmltest" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/wjdp/htmltest</a><br>
<br>
~5min for the whole documentation. Not too bad :)<br></blockquote><div><br>=
</div><div>Very interesting... It took 6min the first time, and I found 271=
 errors in 145 documents. Then I applied your last patch, and it took 3 sec=
onds, since it uses the local cache.. and found 190 errors. your patch look=
s nice too ;)=C2=A0</div><div>We should review that a bit more, but looks l=
ike something we want to add in the AB, at least for the master-next builds=
..=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>

--0000000000008b776105bf6497e8--

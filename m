Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.10270.1617814477994055080
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 09:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=z4TKCTI8;
 spf=pass (domain: linaro.org, ip: 209.85.218.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f43.google.com with SMTP id a7so320826eju.1
        for <docs@lists.yoctoproject.org>; Wed, 07 Apr 2021 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7+9juqqnecIi3DazMtw9zLLWlp6Q9/CeHBU5EoI4Zbw=;
        b=z4TKCTI8DegFfnjUnWnqTAZBaBjZg/dCQvf3W///42L6jDuNC57x8T+nyA851X+Wqv
         BwN3EM43BlaAT2cGEAlfHkTOR6HhY968vYmbq8mfPOgNdS80arVLE1P4uLmo3DSNaGYP
         apyPRlEQjEvUiRG99NeepyZyEQNqNkhO7TAUty8VgfQILgsm2y2/nl2sTvuCmqmQC+vg
         zeWRTanNQC1y/tBL6QXGc455BmaIYT3cUVQm4bIkvjqGIoFFfc/XQS82icEVeeYfTrSl
         ha7e5ZBrovdKexIq16jIwXOi4lQ9PguG3z8my9nsHrx/28ZLvTdlJdn2NmwnIdsEoslK
         mVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7+9juqqnecIi3DazMtw9zLLWlp6Q9/CeHBU5EoI4Zbw=;
        b=auRKe2U1/tGcLCGuOgvqZOE2J4W9uFnJfANDrNRYSLRFZ0txadX+MGy7UtnkIejyrM
         O9jWv8k28HDfpIJ6Tn392gu6DdXrAnDwVcx04IVpJ8Y8vfCaw14J6WgN1dXKOXoBNg0V
         /sAz0AGgI4ObNFBSAF6kZhxcQSHlQhagdZ/FQx0J3ll9d1XMUXJG2Hi6addcXPGPQNGi
         TTSeY6ONO9m/SM4w5ZDX83k/3pLH1d/2buzw7gesSThtg8Gk/9lfx7cLFBX3ifxGnfM7
         NbQ0iuYw7fgVt/fEpDv/Inh62D1o152CRbgD3LUA92LPN63Mrm8XsSviWRXoYRePL1Ey
         KMKg==
X-Gm-Message-State: AOAM533lntv1ctAmsxClsNQKtwyp140AORRidbmVn/l6GJIrEVC7tLz4
	Hbs1VEsGaqPgSAECLDKfqmNZlyKKCQWsr/kJq3g3QA==
X-Google-Smtp-Source: ABdhPJxbyuSMFPgmFfEczp8Fgk794T9+KYMa6V59iFx02kCHqOTTXH/BVXX83nRH7e0/ZX8yz/eiqkd/BEfKk2AGg6o=
X-Received: by 2002:a17:906:5906:: with SMTP id h6mr4987734ejq.288.1617814476334;
 Wed, 07 Apr 2021 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
 <20210107165951.aqx4maful2uhopzx@qschulz> <CAP71WjyK679c8hjEE53PVyi-_8vX5TS6umsXk+y2TGio8c30hQ@mail.gmail.com>
 <CAP71WjxBRT6tbpgDroR0bKq2B0Nvr6pxuMe2nG+5MmGwyVo4VQ@mail.gmail.com>
 <20210407161247.p6jk2ow52scerzqa@qschulz> <CAP71WjwzK4-zmPq0EZ0uAAgdMob9OBP6e6o6=FKNvb_DZ46ouw@mail.gmail.com>
 <20210407164759.cmmr46dbsfwbkxs7@qschulz>
In-Reply-To: <20210407164759.cmmr46dbsfwbkxs7@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 7 Apr 2021 18:54:25 +0200
Message-ID: <CAP71WjwkuehuzXfW=Lqt0JFCYSYBPHcven2NhXQh3+GSGupAsA@mail.gmail.com>
Subject: Re: [docs] broken links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="0000000000002cbb8605bf64c921"

--0000000000002cbb8605bf64c921
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 6:48 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> On Wed, Apr 07, 2021 at 06:40:32PM +0200, Nicolas Dechesne wrote:
> > On Wed, Apr 7, 2021 at 6:12 PM Quentin Schulz <
> > quentin.schulz@streamunlimited.com> wrote:
> >
> > > On Wed, Jan 13, 2021 at 07:26:17PM +0100, Nicolas Dechesne wrote:
> > > > On Thu, Jan 7, 2021 at 6:08 PM Nicolas Dechesne <
> > > nicolas.dechesne@linaro.org>
> > > > wrote:
> > > >
> > > > >
> > > > >
> > > > > On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz <
> > > > > quentin.schulz@streamunlimited.com> wrote:
> > > > >
> > > > >> Hi Nicolas,
> > > > >>
> > > > >> On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:
> > > > >> > hey!
> > > > >> >
> > > > >> > Robert opened a bug for a broken link in the doc, see
> > > > >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168
> > > > >> >
> > > > >> > This is a valid bug, a regression in
> > > > >> > e1bcfe4d8 dev-manual: remove unused labels
> > > > >> >
> > > > >> > Unfortunately, it opens a can of worms... since it looks like
> the
> > > built
> > > > >> in
> > > > >> > linkcheck did not detect the broken links, and this is not the
> only
> > > > >> broken
> > > > >> > link.
> > > > >> >
> > > > >> > I ran an online link checker on
> > > > >> > https://docs.yoctoproject.org/dev-manual/common-tasks.html,
> and it
> > > > >> reported
> > > > >> > the following errors with anchors.. they look like they are
> > > regression
> > > > >> with
> > > > >> > the commit above..
> > > > >> >
> > > > >>
> > > > >> [...]
> > > > >>
> > > > >> It'd be nice to fix the linkcheck indeed.
> > > > >>
> > > > >
> > > > > hmm. could it be that linkcheck only checks for 'external' links?
> > > > >
> > > >
> > > > in the meantime I was looking for a tool I could run locally, and
> found
> > > [1]
> > > >
> > > > It looks like it gives some good output:
> > > >
> > > > $ pytest --check-links --check-anchors --check-links-cache
> > > > _build/html/dev-manual/
> > > >
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#new-recipe-autotooled-package>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#new-recipe-single-c-file-package-hello-world>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#new-recipe-patching-code>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#new-recipe-fetching-code>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#new-recipe-post-installation-scripts>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#new-recipe-storing-and-naming-the-recipe>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#usingpoky-extend-customimage>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#finding-the-temporary-source-code>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#understand-what-gives-your-image-size>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#combining-multiple-versions-library-files-into-one-image>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#using-a-provided-kickstart-file>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#wic-using-the-wic-plugin-interface>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > href=#wic-requirements>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#best-practices-to-follow-when-creating-layers>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#using-bbappend-files>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#incrementing-a-binary-package-version>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#automatically-incrementing-a-binary-package-revision-number>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#qemu-image-running-tests>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-debugging-viewing-logs-from-failed-tasks>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-debugging-viewing-variable-values>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-viewing-dependencies-between-recipes-and-tasks>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-viewing-task-variable-dependencies>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-debugging-taskrunning>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-debugging-bitbake>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-debugging-buildfile>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#platdev-gdb-remotedebug>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-other-debugging-others>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#dev-viewing-task-variable-dependencies>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#platdev-appdev-devshell>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#using-a-quilt-workflow>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#how-to-submit-a-change>
> > > > FAILED _build/html/dev-manual/common-tasks.html <a
> > > > href=#figuring-out-the-mailing-list-to-use>
> > > > FAILED _build/html/dev-manual/qemu.html <a
> > > > href=#qemu-running-under-a-network-file-system-nfs-server>
> > > > FAILED _build/html/dev-manual/qemu.html <a href=#kvm-cond>
> > > > FAILED _build/html/dev-manual/start.html <a href=
> > > > https://autobuilder.yocto.io//pub/nightly/>
> > > > FAILED _build/html/dev-manual/start.html <a href=
> > > > https://autobuilder.yocto.io//pub/nightly/>
> > > > FAILED _build/html/dev-manual/start.html <a
> > > > href=#checkout-out-by-tag-in-poky>
> > > >
> > > > It's slow, it took 7 minutes to check for the dev-manual.. but it's a
> > > first
> > > > step. now we need to fix them!
> > > >
> > > > [1] https://github.com/jupyterlab/pytest-check-links
> > > >
> > >
> > > In the end, I went for htmltest to test links:
> > > https://github.com/wjdp/htmltest
> > >
> > > ~5min for the whole documentation. Not too bad :)
> > >
> >
> > Very interesting... It took 6min the first time, and I found 271 errors
> in
> > 145 documents. Then I applied your last patch, and it took 3 seconds,
> since
> > it uses the local cache.. and found 190 errors. your patch looks nice too
> > ;)
>
> Well... I know what's next then :)


> > We should review that a bit more, but looks like something we want to add
> > in the AB, at least for the master-next builds..
> >
>
> To be fair, I said in the patch that I removed anchor links only :p
>
>
we could run in the AB without Failing at least for now. But just getting
the logs for each build would be really nice. If we ever reach 0 , then we
could start failing in the AB to flag issues!



> I didn't check other links (though htmltest returns two 502 for the AB
> links).
>

I really like that you can have a local config file (in the tree), so that
anyone can run the same config.. this tool looks really quite good! thanks!


>
> Cheers,
> Quentin
>

--0000000000002cbb8605bf64c921
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 7, 2021 at 6:48 PM Quenti=
n Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.=
schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, Apr 07, 2021 at 06:40:32PM +0200, Nicolas=
 Dechesne wrote:<br>
&gt; On Wed, Apr 7, 2021 at 6:12 PM Quentin Schulz &lt;<br>
&gt; <a href=3D"mailto:quentin.schulz@streamunlimited.com" target=3D"_blank=
">quentin.schulz@streamunlimited.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Jan 13, 2021 at 07:26:17PM +0100, Nicolas Dechesne wrote:=
<br>
&gt; &gt; &gt; On Thu, Jan 7, 2021 at 6:08 PM Nicolas Dechesne &lt;<br>
&gt; &gt; <a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">=
nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:quentin.schulz@streamunlimited.com" t=
arget=3D"_blank">quentin.schulz@streamunlimited.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; Hi Nicolas,<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas D=
echesne wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; hey!<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Robert opened a bug for a broken link in the d=
oc, see<br>
&gt; &gt; &gt; &gt;&gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D14168" rel=3D"noreferrer" target=3D"_blank">https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D14168</a><br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; This is a valid bug, a regression in<br>
&gt; &gt; &gt; &gt;&gt; &gt; e1bcfe4d8 dev-manual: remove unused labels<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Unfortunately, it opens a can of worms... sinc=
e it looks like the<br>
&gt; &gt; built<br>
&gt; &gt; &gt; &gt;&gt; in<br>
&gt; &gt; &gt; &gt;&gt; &gt; linkcheck did not detect the broken links, and=
 this is not the only<br>
&gt; &gt; &gt; &gt;&gt; broken<br>
&gt; &gt; &gt; &gt;&gt; &gt; link.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; I ran an online link checker on<br>
&gt; &gt; &gt; &gt;&gt; &gt; <a href=3D"https://docs.yoctoproject.org/dev-m=
anual/common-tasks.html" rel=3D"noreferrer" target=3D"_blank">https://docs.=
yoctoproject.org/dev-manual/common-tasks.html</a>, and it<br>
&gt; &gt; &gt; &gt;&gt; reported<br>
&gt; &gt; &gt; &gt;&gt; &gt; the following errors with anchors.. they look =
like they are<br>
&gt; &gt; regression<br>
&gt; &gt; &gt; &gt;&gt; with<br>
&gt; &gt; &gt; &gt;&gt; &gt; the commit above..<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; [...]<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; It&#39;d be nice to fix the linkcheck indeed.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; hmm. could it be that linkcheck only checks for &#39;ex=
ternal&#39; links?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; in the meantime I was looking for a tool I could run locally=
, and found<br>
&gt; &gt; [1]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It looks like it gives some good output:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $ pytest --check-links --check-anchors --check-links-cache<b=
r>
&gt; &gt; &gt; _build/html/dev-manual/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#new-recipe-autotooled-package&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#new-recipe-single-c-file-package-hello-world&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#new-recipe-patching-code&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#new-recipe-fetching-code&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#new-recipe-post-installation-scripts&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#new-recipe-storing-and-naming-the-recipe&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#usingpoky-extend-customimage&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#finding-the-temporary-source-code&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#understand-what-gives-your-image-size&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#combining-multiple-versions-library-files-into-one-i=
mage&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#using-a-provided-kickstart-file&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#wic-using-the-wic-plugin-interface&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; href=3D#wic-requirements&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#best-practices-to-follow-when-creating-layers&gt;<br=
>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#using-bbappend-files&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#incrementing-a-binary-package-version&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#automatically-incrementing-a-binary-package-revision=
-number&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#qemu-image-running-tests&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-debugging-viewing-logs-from-failed-tasks&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-debugging-viewing-variable-values&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-viewing-dependencies-between-recipes-and-tasks&g=
t;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-viewing-task-variable-dependencies&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-debugging-taskrunning&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-debugging-bitbake&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-debugging-buildfile&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#platdev-gdb-remotedebug&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-other-debugging-others&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#dev-viewing-task-variable-dependencies&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#platdev-appdev-devshell&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#using-a-quilt-workflow&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#how-to-submit-a-change&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/common-tasks.html &lt;a<br>
&gt; &gt; &gt; href=3D#figuring-out-the-mailing-list-to-use&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/qemu.html &lt;a<br>
&gt; &gt; &gt; href=3D#qemu-running-under-a-network-file-system-nfs-server&=
gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/qemu.html &lt;a href=3D#kvm-co=
nd&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/start.html &lt;a href=3D<br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yocto.io//pub/nightly/" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io//pub/nightly=
/</a>&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/start.html &lt;a href=3D<br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yocto.io//pub/nightly/" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io//pub/nightly=
/</a>&gt;<br>
&gt; &gt; &gt; FAILED _build/html/dev-manual/start.html &lt;a<br>
&gt; &gt; &gt; href=3D#checkout-out-by-tag-in-poky&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It&#39;s slow, it took 7 minutes to check for the dev-manual=
.. but it&#39;s a<br>
&gt; &gt; first<br>
&gt; &gt; &gt; step. now we need to fix them!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1] <a href=3D"https://github.com/jupyterlab/pytest-check-li=
nks" rel=3D"noreferrer" target=3D"_blank">https://github.com/jupyterlab/pyt=
est-check-links</a><br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; In the end, I went for htmltest to test links:<br>
&gt; &gt; <a href=3D"https://github.com/wjdp/htmltest" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/wjdp/htmltest</a><br>
&gt; &gt;<br>
&gt; &gt; ~5min for the whole documentation. Not too bad :)<br>
&gt; &gt;<br>
&gt; <br>
&gt; Very interesting... It took 6min the first time, and I found 271 error=
s in<br>
&gt; 145 documents. Then I applied your last patch, and it took 3 seconds, =
since<br>
&gt; it uses the local cache.. and found 190 errors. your patch looks nice =
too<br>
&gt; ;)<br>
<br>
Well... I know what&#39;s next then :)=C2=A0</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; We should review that a bit more, but looks like something we want to =
add<br>
&gt; in the AB, at least for the master-next builds..<br>
&gt; <br>
<br>
To be fair, I said in the patch that I removed anchor links only :p<br>
<br></blockquote><div><br></div><div>we could run in the AB without Failing=
 at least for now. But just getting the logs for each build would be really=
 nice. If we ever reach 0 , then we could start failing in the AB to flag i=
ssues!</div><div></div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
I didn&#39;t check other links (though htmltest returns two 502 for the AB =
links).<br></blockquote><div><br></div><div>I really like that you can have=
 a local config file (in the tree), so that anyone can run the same config.=
. this tool looks really quite good! thanks!</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>

--0000000000002cbb8605bf64c921--

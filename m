Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.599.1610562390041579430
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Jan 2021 10:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d1C57tkr;
 spf=pass (domain: linaro.org, ip: 209.85.218.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f49.google.com with SMTP id d17so4446704ejy.9
        for <docs@lists.yoctoproject.org>; Wed, 13 Jan 2021 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MtHPSqjM5IvDWZFOgAkkWzKOLJh0R1G/c6+ZJcd4p/0=;
        b=d1C57tkr8EGwLSXcvyY7DGPA6BW6lakF3o1meYpyUSVex1nSgV8R03jJXjR/unU/Od
         vElFz4JD0yRyGHG74caCBaHDgEHXUkNb2aUneut7fv3di7ShFFmlPZc5dCi7CDqAAtUu
         GNJyCkcDou2ra7TEYjdprjNiVltNlk9q+gX4LJ3o4/8sSfQpMiHppk58YeX5z9U7mA8N
         ZgIqKaugFRMw0HAgHNifO2GKdtSeFyXb6mx3pXtGoU+8xarxg+q7zdgLDRQqpJV9LUQV
         HoAueaHs2kKUVX789kb24Eix0BdFmOTmZeCpfCWghykRDegeABvzRQFw1/al2nKopakC
         MXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MtHPSqjM5IvDWZFOgAkkWzKOLJh0R1G/c6+ZJcd4p/0=;
        b=nOtnUx/6tutQsyCKmupJlyyJgl33ur1m8NyVLmawcEIXY+1K5IW/SNqgSlvB3RgFiI
         A/tJ7QaH1Ed7EsbpSP72viW7AFWAS6OMqOwa0JIKgOE2NqHCGqF95Jwexcw4fYVSVkbm
         nr3NW0jI7Schj6jc8YFxKqauRM//7EzRGdM3mYEneXtpkYoNtyVp7/aWtBD3zR2dSByF
         9Sxyayrys8ondtKkL9oI2RUndPaiIVNbl/QVRSldU5is9ftNKs9O/nshNjAHIXa2d3bD
         S7YjyGpwbWI+q3Q6Cn78Jw60hHUWNH8r8kXIyPxTB7e6wbb1bN+9sohComn+2AafE5Rz
         RjbA==
X-Gm-Message-State: AOAM530gEG/U3VOLqwc4/QRHuRJWai3ut8E+reYdRsEFuo14UVMAjXzM
	a6Yl7nb6jFN6Hr0ONWfzP/xhUrFyT1GyFIiieSzp9A==
X-Google-Smtp-Source: ABdhPJwuUGx4+1axrMyWe16kaWoCEYdoF9DG5cPXT8TeDH/p2BThuvw12O9CfJQCQ/PSzvM0yky99bKl5OLLtIYNL04=
X-Received: by 2002:a17:907:41ad:: with SMTP id of21mr2572850ejb.347.1610562388220;
 Wed, 13 Jan 2021 10:26:28 -0800 (PST)
MIME-Version: 1.0
References: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
 <20210107165951.aqx4maful2uhopzx@qschulz> <CAP71WjyK679c8hjEE53PVyi-_8vX5TS6umsXk+y2TGio8c30hQ@mail.gmail.com>
In-Reply-To: <CAP71WjyK679c8hjEE53PVyi-_8vX5TS6umsXk+y2TGio8c30hQ@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 13 Jan 2021 19:26:17 +0100
Message-ID: <CAP71WjxBRT6tbpgDroR0bKq2B0Nvr6pxuMe2nG+5MmGwyVo4VQ@mail.gmail.com>
Subject: Re: [docs] broken links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="00000000000009f5c805b8cc4784"

--00000000000009f5c805b8cc4784
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 6:08 PM Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

>
>
> On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
>
>> Hi Nicolas,
>>
>> On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:
>> > hey!
>> >
>> > Robert opened a bug for a broken link in the doc, see
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168
>> >
>> > This is a valid bug, a regression in
>> > e1bcfe4d8 dev-manual: remove unused labels
>> >
>> > Unfortunately, it opens a can of worms... since it looks like the built
>> in
>> > linkcheck did not detect the broken links, and this is not the only
>> broken
>> > link.
>> >
>> > I ran an online link checker on
>> > https://docs.yoctoproject.org/dev-manual/common-tasks.html, and it
>> reported
>> > the following errors with anchors.. they look like they are regression
>> with
>> > the commit above..
>> >
>>
>> [...]
>>
>> It'd be nice to fix the linkcheck indeed.
>>
>
> hmm. could it be that linkcheck only checks for 'external' links?
>

in the meantime I was looking for a tool I could run locally, and found [1]

It looks like it gives some good output:

$ pytest --check-links --check-anchors --check-links-cache
_build/html/dev-manual/

FAILED _build/html/dev-manual/common-tasks.html <a
href=#new-recipe-autotooled-package>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#new-recipe-single-c-file-package-hello-world>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#new-recipe-patching-code>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#new-recipe-fetching-code>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#new-recipe-post-installation-scripts>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#new-recipe-storing-and-naming-the-recipe>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#usingpoky-extend-customimage>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#finding-the-temporary-source-code>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#understand-what-gives-your-image-size>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#combining-multiple-versions-library-files-into-one-image>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#using-a-provided-kickstart-file>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#wic-using-the-wic-plugin-interface>
FAILED _build/html/dev-manual/common-tasks.html <a href=#wic-requirements>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#best-practices-to-follow-when-creating-layers>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#using-bbappend-files>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#incrementing-a-binary-package-version>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#automatically-incrementing-a-binary-package-revision-number>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#qemu-image-running-tests>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-debugging-viewing-logs-from-failed-tasks>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-debugging-viewing-variable-values>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-viewing-dependencies-between-recipes-and-tasks>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-viewing-task-variable-dependencies>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-debugging-taskrunning>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-debugging-bitbake>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-debugging-buildfile>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#platdev-gdb-remotedebug>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-other-debugging-others>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#dev-viewing-task-variable-dependencies>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#platdev-appdev-devshell>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#using-a-quilt-workflow>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#how-to-submit-a-change>
FAILED _build/html/dev-manual/common-tasks.html <a
href=#figuring-out-the-mailing-list-to-use>
FAILED _build/html/dev-manual/qemu.html <a
href=#qemu-running-under-a-network-file-system-nfs-server>
FAILED _build/html/dev-manual/qemu.html <a href=#kvm-cond>
FAILED _build/html/dev-manual/start.html <a href=
https://autobuilder.yocto.io//pub/nightly/>
FAILED _build/html/dev-manual/start.html <a href=
https://autobuilder.yocto.io//pub/nightly/>
FAILED _build/html/dev-manual/start.html <a
href=#checkout-out-by-tag-in-poky>

It's slow, it took 7 minutes to check for the dev-manual.. but it's a first
step. now we need to fix them!

[1] https://github.com/jupyterlab/pytest-check-links


>
>>
>> I have on my todolist to remove all anchor links to use refs instead but
>> it's
>> not fun work to do and it's time consuming. I can now probably "automate"
>> all of this with some python regexp and manually fix the ones returned
>> by your online link checker :) (and use the online link checker to
>> validate the changes).
>>
>> I'd then add in the README/CONTRIBUTING that we do not allow such links
>> and we have to be careful to enforce this when receiving patches.
>>
>> All this in the event that we can't find what's wrong with our
>> linkcheck.
>>
>> Cheers,
>> Quentin
>>
>

--00000000000009f5c805b8cc4784
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 6:08 PM Nicola=
s Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.deche=
sne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at =
5:59 PM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited=
.com" target=3D"_blank">quentin.schulz@streamunlimited.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Nicolas,<br>
<br>
On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:<br>
&gt; hey!<br>
&gt; <br>
&gt; Robert opened a bug for a broken link in the doc, see<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14168" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D14168</a><br>
&gt; <br>
&gt; This is a valid bug, a regression in<br>
&gt; e1bcfe4d8 dev-manual: remove unused labels<br>
&gt; <br>
&gt; Unfortunately, it opens a can of worms... since it looks like the buil=
t in<br>
&gt; linkcheck did not detect the broken links, and this is not the only br=
oken<br>
&gt; link.<br>
&gt; <br>
&gt; I ran an online link checker on<br>
&gt; <a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev-man=
ual/common-tasks.html</a>, and it reported<br>
&gt; the following errors with anchors.. they look like they are regression=
 with<br>
&gt; the commit above..<br>
&gt; <br>
<br>
[...]<br>
<br>
It&#39;d be nice to fix the linkcheck indeed.<br></blockquote><div><br></di=
v><div>hmm. could it be that linkcheck only checks for &#39;external&#39; l=
inks?=C2=A0</div></div></div></blockquote><div><br></div><div>in the meanti=
me I was looking for a tool I could run locally, and found [1]</div><div><b=
r></div><div>It looks like it gives some good output:</div><div><br></div><=
div>$ pytest --check-links --check-anchors --check-links-cache _build/html/=
dev-manual/<br></div><div><br></div><div>FAILED _build/html/dev-manual/comm=
on-tasks.html &lt;a href=3D#new-recipe-autotooled-package&gt;<br>FAILED _bu=
ild/html/dev-manual/common-tasks.html &lt;a href=3D#new-recipe-single-c-fil=
e-package-hello-world&gt;<br>FAILED _build/html/dev-manual/common-tasks.htm=
l &lt;a href=3D#new-recipe-patching-code&gt;<br>FAILED _build/html/dev-manu=
al/common-tasks.html &lt;a href=3D#new-recipe-fetching-code&gt;<br>FAILED _=
build/html/dev-manual/common-tasks.html &lt;a href=3D#new-recipe-post-insta=
llation-scripts&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;=
a href=3D#new-recipe-storing-and-naming-the-recipe&gt;<br>FAILED _build/htm=
l/dev-manual/common-tasks.html &lt;a href=3D#usingpoky-extend-customimage&g=
t;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#finding=
-the-temporary-source-code&gt;<br>FAILED _build/html/dev-manual/common-task=
s.html &lt;a href=3D#understand-what-gives-your-image-size&gt;<br>FAILED _b=
uild/html/dev-manual/common-tasks.html &lt;a href=3D#combining-multiple-ver=
sions-library-files-into-one-image&gt;<br>FAILED _build/html/dev-manual/com=
mon-tasks.html &lt;a href=3D#using-a-provided-kickstart-file&gt;<br>FAILED =
_build/html/dev-manual/common-tasks.html &lt;a href=3D#wic-using-the-wic-pl=
ugin-interface&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a=
 href=3D#wic-requirements&gt;<br>FAILED _build/html/dev-manual/common-tasks=
.html &lt;a href=3D#best-practices-to-follow-when-creating-layers&gt;<br>FA=
ILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#using-bbappend-=
files&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#=
incrementing-a-binary-package-version&gt;<br>FAILED _build/html/dev-manual/=
common-tasks.html &lt;a href=3D#automatically-incrementing-a-binary-package=
-revision-number&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt=
;a href=3D#qemu-image-running-tests&gt;<br>FAILED _build/html/dev-manual/co=
mmon-tasks.html &lt;a href=3D#dev-debugging-viewing-logs-from-failed-tasks&=
gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#dev-de=
bugging-viewing-variable-values&gt;<br>FAILED _build/html/dev-manual/common=
-tasks.html &lt;a href=3D#dev-viewing-dependencies-between-recipes-and-task=
s&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#dev-=
viewing-task-variable-dependencies&gt;<br>FAILED _build/html/dev-manual/com=
mon-tasks.html &lt;a href=3D#dev-debugging-taskrunning&gt;<br>FAILED _build=
/html/dev-manual/common-tasks.html &lt;a href=3D#dev-debugging-bitbake&gt;<=
br>FAILED _build/html/dev-manual/common-tasks.html &lt;a href=3D#dev-debugg=
ing-buildfile&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a =
href=3D#platdev-gdb-remotedebug&gt;<br>FAILED _build/html/dev-manual/common=
-tasks.html &lt;a href=3D#dev-other-debugging-others&gt;<br>FAILED _build/h=
tml/dev-manual/common-tasks.html &lt;a href=3D#dev-viewing-task-variable-de=
pendencies&gt;<br>FAILED _build/html/dev-manual/common-tasks.html &lt;a hre=
f=3D#platdev-appdev-devshell&gt;<br>FAILED _build/html/dev-manual/common-ta=
sks.html &lt;a href=3D#using-a-quilt-workflow&gt;<br>FAILED _build/html/dev=
-manual/common-tasks.html &lt;a href=3D#how-to-submit-a-change&gt;<br>FAILE=
D _build/html/dev-manual/common-tasks.html &lt;a href=3D#figuring-out-the-m=
ailing-list-to-use&gt;<br>FAILED _build/html/dev-manual/qemu.html &lt;a hre=
f=3D#qemu-running-under-a-network-file-system-nfs-server&gt;<br>FAILED _bui=
ld/html/dev-manual/qemu.html &lt;a href=3D#kvm-cond&gt;<br>FAILED _build/ht=
ml/dev-manual/start.html &lt;a href=3D<a href=3D"https://autobuilder.yocto.=
io//pub/nightly/">https://autobuilder.yocto.io//pub/nightly/</a>&gt;<br>FAI=
LED _build/html/dev-manual/start.html &lt;a href=3D<a href=3D"https://autob=
uilder.yocto.io//pub/nightly/">https://autobuilder.yocto.io//pub/nightly/</=
a>&gt;<br>FAILED _build/html/dev-manual/start.html &lt;a href=3D#checkout-o=
ut-by-tag-in-poky&gt;<br></div><div><br></div><div>It&#39;s slow, it took 7=
 minutes to check for the dev-manual.. but it&#39;s a first step. now we ne=
ed to fix them!</div><div><br></div><div>[1]=C2=A0<a href=3D"https://github=
.com/jupyterlab/pytest-check-links">https://github.com/jupyterlab/pytest-ch=
eck-links</a>=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I have on my todolist to remove all anchor links to use refs instead but it=
&#39;s<br>
not fun work to do and it&#39;s time consuming. I can now probably &quot;au=
tomate&quot;<br>
all of this with some python regexp and manually fix the ones returned<br>
by your online link checker :) (and use the online link checker to<br>
validate the changes).<br>
<br>
I&#39;d then add in the README/CONTRIBUTING that we do not allow such links=
<br>
and we have to be careful to enforce this when receiving patches.<br>
<br>
All this in the event that we can&#39;t find what&#39;s wrong with our<br>
linkcheck.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000009f5c805b8cc4784--

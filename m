Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.6380.1623405188987390480
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 02:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pTqv9124;
 spf=pass (domain: linaro.org, ip: 209.85.218.48, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id k25so3645303eja.9
        for <docs@lists.yoctoproject.org>; Fri, 11 Jun 2021 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzB5G3+6ah0GIL2fPMe0Qg6WNeJGM4brdccHN8Rc+nY=;
        b=pTqv9124IG/ESbeyieY1hIauk3UgcIsRRET1mnFA6NJ28A0bqDw0nxag4RIhM120uL
         VCf3I9OYCPq8j3LkF9MjO60eIQB86tuismLNkC6eGeH/KeJyTozPLhBM0F9A7sWALJaD
         Ljo+OMhFTa0iCsGQtV/nw7kstB8CyHRqA+RngCVFuZZGYMrMZMduFuMFF/mWxkg32wkn
         uc1BbdqBMjeiPR2z0+zzuyG5VF3pnaCgm+hasFEnIgbN2qufOuITb3B4E0AmQvTLPcNH
         s+gRhmBhrhiQVMLb3ihRbWqz3lK8OA7ahSjNZjkDBZlVRR5ZOhyG2UHkd7e7ULK1MwOs
         lc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzB5G3+6ah0GIL2fPMe0Qg6WNeJGM4brdccHN8Rc+nY=;
        b=n1niYMDSPOFpJJXeuxCxPleAAKUxDSdD95D9ji6Llm10PNPleAVSzpTC5srGjVshvs
         3BFbKH7OLsVWloKRH3aHRxqh9WhQhNOJAXHrB43LkgYS6Tl9vLNeWyQDUXUKPyqCLGgH
         qGTwN1gZmDfrKl8dLqC9NgLmmiKeRlEuYIABRXW+i6PBhN81vr1i/D1JLoM3RVmrhI2d
         LV+GXAASMghlnYvWGb1lwO+H/YekViJ1pgnb1OQGmSAN10coJHbQ3pNdQuj794CpoftZ
         vBUXmkwjiZ/XBcw63RCbP1q5T4oHR0oU9bnJQjS+/TujobYz28LQEpgdBszwPisBkaj7
         48yg==
X-Gm-Message-State: AOAM533f7YhvFOolAxDHQ9kjNFnZerLR9TyoU1bvviyySGrfNCXQgvVk
	2PH7U2saTSLtcQbhJXBR7AQKOkvkPJNtbTfjVrbUrA==
X-Google-Smtp-Source: ABdhPJwSAbiDK8nFtL9R7ZHwSkggQrFCIDgk+9XFCjICydSqXJM/TBztEL9uRDc1b4TdLrwgM7OyKtX2XTws093v5T4=
X-Received: by 2002:a17:906:520f:: with SMTP id g15mr2986544ejm.126.1623405187353;
 Fri, 11 Jun 2021 02:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <1675A932C413C877.8243@lists.yoctoproject.org> <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com> <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org> <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
In-Reply-To: <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 11 Jun 2021 11:52:56 +0200
Message-ID: <CAP71WjyrOwdZOKrEO=g52hLjeCP_QKHarGzrAWSuwXYCymDX2A@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000084e7bd05c47a7964"

--00000000000084e7bd05c47a7964
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 11, 2021 at 11:15 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-06-11 at 09:48 +0200, Michael Opdenacker wrote:
> > Hello,
> >
> > On 6/10/21 2:03 PM, Michael Opdenacker wrote:
> > > Hi Nicolas,
> > >
> > > On 6/10/21 12:04 PM, Nicolas Dechesne wrote:
> > > > Can you please push to master-next , so that everyone can see what it
> > > > looks like without having to rebuild
> > > > (e.g. http://docs.yoctoproject.org/next/
> > > > <http://docs.yoctoproject.org/next/> will be updated after you
> push)?
> > > >
> > > > e.g. i am cc'ding Vineela (release manager) , so that she gets a
> > > > chance to review.
> > >
> > > Done. I couldn't find this URL any more, so I wasn't sure that the
> > > functionality existed.
> > >
> > > Thanks in advance for the reviews,
> >
> >
> > With these changes visible on http://docs.yoctoproject.org/next/, the
> > location of the release notes is changing. How much would this break
> > other resources, such as links on our website? I remember Paul's warning
> > 5 days before Hardknott was released, but I hope we are now far enough
> > from the next release.
> >
> > Another question is whether "Release notes" is the right title for these
> > migration guides, at least in the left menu. Shouldn't we just call them
> > "Release migration guides" as they truly are, knowing that the true
> > release notes are on
> > https://www.yoctoproject.org/software-overview/downloads/?
>
> Yes, they're migration guides, the release notes are something different.
>

Side question.. should we move the release notes into the docs website? now
that it's based on Sphinx, it looks like it would be well suited..


>
> Cheers,
>
> Richard
>
>

--00000000000084e7bd05c47a7964
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 11, 2021 at 11:15 AM Rich=
ard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richar=
d.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Fri, 2021-06-11 at 09:48 +0200, Michael Opde=
nacker wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; On 6/10/21 2:03 PM, Michael Opdenacker wrote:<br>
&gt; &gt; Hi Nicolas,<br>
&gt; &gt; <br>
&gt; &gt; On 6/10/21 12:04 PM, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt; Can you please push to master-next , so that everyone can se=
e what it<br>
&gt; &gt; &gt; looks like without having to rebuild<br>
&gt; &gt; &gt; (e.g.=C2=A0<a href=3D"http://docs.yoctoproject.org/next/" re=
l=3D"noreferrer" target=3D"_blank">http://docs.yoctoproject.org/next/</a><b=
r>
&gt; &gt; &gt; &lt;<a href=3D"http://docs.yoctoproject.org/next/" rel=3D"no=
referrer" target=3D"_blank">http://docs.yoctoproject.org/next/</a>&gt; will=
 be updated after you push)?=C2=A0<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; e.g. i am cc&#39;ding Vineela (release manager) , so that sh=
e gets a<br>
&gt; &gt; &gt; chance to review.<br>
&gt; &gt; <br>
&gt; &gt; Done. I couldn&#39;t find this URL any more, so I wasn&#39;t sure=
 that the<br>
&gt; &gt; functionality existed.<br>
&gt; &gt; <br>
&gt; &gt; Thanks in advance for the reviews,<br>
&gt; <br>
&gt; <br>
&gt; With these changes visible on <a href=3D"http://docs.yoctoproject.org/=
next/" rel=3D"noreferrer" target=3D"_blank">http://docs.yoctoproject.org/ne=
xt/</a>, the<br>
&gt; location of the release notes is changing. How much would this break<b=
r>
&gt; other resources, such as links on our website? I remember Paul&#39;s w=
arning<br>
&gt; 5 days before Hardknott was released, but I hope we are now far enough=
<br>
&gt; from the next release.<br>
&gt; <br>
&gt; Another question is whether &quot;Release notes&quot; is the right tit=
le for these<br>
&gt; migration guides, at least in the left menu. Shouldn&#39;t we just cal=
l them<br>
&gt; &quot;Release migration guides&quot; as they truly are, knowing that t=
he true<br>
&gt; release notes are on<br>
&gt; <a href=3D"https://www.yoctoproject.org/software-overview/downloads/" =
rel=3D"noreferrer" target=3D"_blank">https://www.yoctoproject.org/software-=
overview/downloads/</a>?<br>
<br>
Yes, they&#39;re migration guides, the release notes are something differen=
t.<br></blockquote><div><br></div><div>Side question.. should we move the r=
elease notes into the docs website? now that it&#39;s based on Sphinx, it l=
ooks like it would be well suited..=C2=A0</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000084e7bd05c47a7964--

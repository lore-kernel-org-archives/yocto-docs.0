Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.277.1617209504235655951
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vy9n1hvV;
 spf=pass (domain: linaro.org, ip: 209.85.218.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f52.google.com with SMTP id w3so31116180ejc.4
        for <docs@lists.yoctoproject.org>; Wed, 31 Mar 2021 09:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HkFDeZpktvN53YC/EJdSGMyTaBqoUvLe2UDL8LEClS8=;
        b=vy9n1hvV5jFuqXbnTkphu6u4v0Q9ycC3aog4OM+gQZY1u8gmJumQ7UzrhQOqAQ/mSM
         1tiLaqcUteVYYgu/iMVm1A7EUVOo5EFbHBuD72R1lbBAf18d4YvYd0ZIcVoPB88Yb8RR
         FhH5eM5yeazLiU5rwVsfZBuFPL8bgW21Cb+lVsRDziV09H++Wd4gd1sNP1w1S57MDeCu
         aVqRZM81iWyMPpj7aF7RjtqNfTlBJoIWT77K41zI+WQaLfDATIf269zUoWbN0FqZDt6s
         vpBYBrgv0y3dCaf+Pc1+BA5LcaJcfYV7plAfBlGK7/KaVc2MocQaBb15pQl9qqqLRWTF
         yeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HkFDeZpktvN53YC/EJdSGMyTaBqoUvLe2UDL8LEClS8=;
        b=e/hUXZtfgoD2hJ/eV+eUa93V5gDzYKwAZ+CD/W+/dvXxtiaxemhuP3W7BmP1xWqTn6
         G0q5FYnhAdlLoc7hIXg5kO3TLjHlhiWZDXAwA3Kli0LUDlzUXu/fyes6Z2TV7BZwJWRH
         OXl+AkMpu/5OhORyDj7jkT+cbN1INJnPJ3E8VBEj4E98YYkxlvspid6sjYvkJVzxwbbo
         Kes10Z3ryyR/SAymQkyTm27U2QbJoQxa7GzfoKnyjGLx0Si2yr7YQHbbYpWOMAinG5A0
         CbVclX6Jzf9JAMN3V3RPpiQkiJlj+4OkP3Zyhdbr4AXxfV0tJowZKdb1JwA9qLOvt4hi
         GqAg==
X-Gm-Message-State: AOAM531rQbPXywiWZdyTS3zlCkk4nc8OItHBIcE8IGUg//rnLcHCOX0X
	svP4aWWERSZjJLmRLH/1KVDcB9zvwsEYgd9iDmLxNg==
X-Google-Smtp-Source: ABdhPJx0VqHdx3oIU1wf8OIQWpGNQqCf4atPKSSXBfotXYcovC2CrSNh8rDRamgqMJ7XWI6XfgDiIY43XSM9tmJ0hrM=
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr4473785ejb.91.1617209502726;
 Wed, 31 Mar 2021 09:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com> <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz> <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
 <603250fc-2501-32b9-66be-4d10c32545f0@bootlin.com> <16717AD05E03365C.31611@lists.yoctoproject.org>
 <b80f3ecedac04c8cb3ada50089d84983@XBOX03.axis.com>
In-Reply-To: <b80f3ecedac04c8cb3ada50089d84983@XBOX03.axis.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 31 Mar 2021 18:51:32 +0200
Message-ID: <CAP71Wjyuwzz558VPYhJUCK=r6+rw_bsujycq8feFxNWATy3jqQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f012f505bed7edf7"

--000000000000f012f505bed7edf7
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 6:44 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On
> Behalf
> > Of Peter Kjellerstedt
> > Sent: den 31 mars 2021 18:40
> > To: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > Cc: docs@lists.yoctoproject.org
> > Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
> >
> > > -----Original Message-----
> > > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On
> > Behalf
> > > Of Michael Opdenacker
> > > Sent: den 30 mars 2021 18:25
> > > To: Nicolas Dechesne <nicolas.dechesne@linaro.org>; Quentin Schulz
> > > <quentin.schulz@streamunlimited.com>
> > > Cc: docs@lists.yoctoproject.org
> > > Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
> > >
> > > Hi Nicolas,
> > >
> > > On 3/30/21 5:42 PM, Nicolas Dechesne wrote:
> > > > On 3/30/21 5:36 PM, Quentin Schulz wrote:
> > > >
> > > > Looks fine for me too.
> > > > However please avoid cover letter when you have just one patch. You
> > > > can add additional information when you send one email, if you add it
> > > > after the commit message (after the ---), this will not be used when
> > > > applying the patch.
> > >
> > >
> > > Very good to know! I'll do that next time.
> > > Indeed, I didn't want to provide some context by replying to my patch.
> > >
> > > Or maybe I'm just being too verbose ;-)
> > >
> > > Michael.
> >
> > Please make sure to prefix the commit subjects with a relevant document
> > or similar, just like we do for all commits to, e.g., OE-Core. Contrary
> > to, e.g., commits in the bitbake repository, there is no prefix added
> > when the commits to the documentation repository are included in poky,
> > making these commit stand out and lacking context when using, e.g.,
> > `git log --oneline`. Look back through the git log to get examples of
> > how this has traditionally been done.
> >
> > //Peter
>
> And I of course chose a bad example mail to respond to as this one
> actually
> has a prefix. ;)
>

well. now that you say it... i think the prefix should be
'overview-manual'  , or 'ref-manual' if we look at past commits!


>
> //Peter
>
>
> 
>
>

--000000000000f012f505bed7edf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 31, 2021 at 6:44 PM Peter=
 Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank=
">docs@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:docs@lists.yoctopro=
ject.org" target=3D"_blank">docs@lists.yoctoproject.org</a>&gt; On Behalf<b=
r>
&gt; Of Peter Kjellerstedt<br>
&gt; Sent: den 31 mars 2021 18:40<br>
&gt; To: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootl=
in.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank">=
docs@lists.yoctoproject.org</a><br>
&gt; Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvement=
s<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_=
blank">docs@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:docs@lists.yoc=
toproject.org" target=3D"_blank">docs@lists.yoctoproject.org</a>&gt; On<br>
&gt; Behalf<br>
&gt; &gt; Of Michael Opdenacker<br>
&gt; &gt; Sent: den 30 mars 2021 18:25<br>
&gt; &gt; To: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@lina=
ro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;; Quentin Schu=
lz<br>
&gt; &gt; &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com" target=
=
=3D"_blank">quentin.schulz@streamunlimited.com</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_bl=
ank">docs@lists.yoctoproject.org</a><br>
&gt; &gt; Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improv=
ements<br>
&gt; &gt;<br>
&gt; &gt; Hi Nicolas,<br>
&gt; &gt;<br>
&gt; &gt; On 3/30/21 5:42 PM, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt; On 3/30/21 5:36 PM, Quentin Schulz wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Looks fine for me too.<br>
&gt; &gt; &gt; However please avoid cover letter when you have just one pa=
tch. You<br>
&gt; &gt; &gt; can add additional information when you send one email, if =
you add it<br>
&gt; &gt; &gt; after the commit message (after the ---), this will not be =
used when<br>
&gt; &gt; &gt; applying the patch.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Very good to know! I&#39;ll do that next time.<br>
&gt; &gt; Indeed, I didn&#39;t want to provide some context by replying to=
 my patch.<br>
&gt; &gt;<br>
&gt; &gt; Or maybe I&#39;m just being too verbose ;-)<br>
&gt; &gt;<br>
&gt; &gt; Michael.<br>
&gt; <br>
&gt; Please make sure to prefix the commit subjects with a relevant docume=
nt<br>
&gt; or similar, just like we do for all commits to, e.g., OE-Core. Contra=
ry<br>
&gt; to, e.g., commits in the bitbake repository, there is no prefix added=
<br>
&gt; when the commits to the documentation repository are included in poky=
,<br>
&gt; making these commit stand out and lacking context when using, e.g.,<b=
r>
&gt; `git log --oneline`. Look back through the git log to get examples of=
<br>
&gt; how this has traditionally been done.<br>
&gt; <br>
&gt; //Peter<br>
<br>
And I of course chose a bad example mail to respond to as this one actuall=
y <br>
has a prefix. ;)<br></blockquote><div><br></div><div>well. now that you sa=
y it... i think the prefix should be &#39;overview-manual&#39;=C2=A0 , or &=
#39;ref-manual&#39; if we look at past commits!</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
//Peter<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000f012f505bed7edf7--

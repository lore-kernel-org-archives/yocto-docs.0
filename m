Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.48304.1590489840709212021
 for <docs@lists.yoctoproject.org>;
 Tue, 26 May 2020 03:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TywpeRuk;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id b131so7882469ybg.13
        for <docs@lists.yoctoproject.org>; Tue, 26 May 2020 03:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ae/HnoAUtPcEC8Rn5EyswM48+awJti9gJWYY+9TUZQg=;
        b=TywpeRukpFZObDU0SWoX5kTXLkGmROqCRt4p6TbZFFNhh4Ly93fbEETk/ap5YRCLYK
         CaSG5BP5pxOjowjZ4+ZMhmam2uBbS74N9lSYyumuudLQ4EPzWksV7UCfGAcI8FAaZ1Th
         wysl7Oj5o35lsoqH+UKXWunw1q69HsYiPPqAfd9JsIMAk8eizzRhcsJFuVAM9VuDXT9k
         uaxWKD8OObrj1ChXzV3q2WIQ5j4OWuXmVL+zfSXGln0NZk72GKKwtZqBFTWS7tY4SLGc
         PixQtDdGBNYZ3A1KVTFmcH9gWues++z5Z2qD3qA1l7B95OLYh6H4hLhSdKAHmERVTADA
         Yl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ae/HnoAUtPcEC8Rn5EyswM48+awJti9gJWYY+9TUZQg=;
        b=OfCZ3OGDU+rKu+6hR6MC0hVBK/BfsSUOunBZgzrsbEqq8KXPmy5gdCbNLVub/T/k3j
         gUtU/mEZ95/2bkc5X9nh0/LhubRmhVO7gu2txe36XVNqb2gzKoJ0mQtx7Q14F3x8M2Tn
         XdRKyR1VuwjIsThVu8rR2nxOA+eNTPXL1pGvUjuXb9zFJKvI+jO0N/Ij/ZtxQ20fhfLy
         PGSBr70hUkZpP1+6KZLgIZAATmAD9WrdgpD9lVHO2guEVh7DPLXCeTOHVALavF8X4pSW
         QYCcVq7vphRwql+FDj6L1bOmp1NPPpnLRd8NwXse4yTaUSSYwWOSppViUx+xI7MG3Xed
         7fww==
X-Gm-Message-State: AOAM531uwYniTzIATSNLC1W/TRZZKk5bMSwPi41gD2ZoiAQax8WAu0Xh
	/QVB9aSCjp4DnUE00y2bRZ6DdFi4cvLA1waeTTfuHA==
X-Google-Smtp-Source: ABdhPJxzlUxjpgU17NF/FBYq7XujfkU4/PY3VVJoU4YCziWVZTCPxoCKrYNWh9+Qdd7Hb0ln/uWxMexeUHYCzuTDipc=
X-Received: by 2002:a25:8b0c:: with SMTP id i12mr548904ybl.371.1590489839642;
 Tue, 26 May 2020 03:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
 <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
 <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
 <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
 <alpine.LFD.2.21.2004161404130.54465@localhost.localdomain>
 <DM6PR11MB367614B1115E7BA06017F79FE5B70@DM6PR11MB3676.namprd11.prod.outlook.com>
 <CAP71WjwWH-DVijt_bKwoNvHsUBvw3PwcN9yx6QKUiafAypf1yg@mail.gmail.com>
In-Reply-To: <CAP71WjwWH-DVijt_bKwoNvHsUBvw3PwcN9yx6QKUiafAypf1yg@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 26 May 2020 12:43:48 +0200
Message-ID: <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: Mark Morton <Mark.Morton@windriver.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e942ea05a68ac557"

--000000000000e942ea05a68ac557
Content-Type: text/plain; charset="UTF-8"

On Mon, May 25, 2020 at 9:33 AM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> hi Mark,
>
>
> On Thu, May 21, 2020 at 10:42 PM Mark Morton <Mark.Morton@windriver.com>
> wrote:
>
>> Hi:
>>
>> I'd like to actually start planning this conversion to Sphinx. So far
>> myself, Rob D., Nicolas, and Tim O. are all interested in helping out.
>>
>> I'd like to have a Zoom meeting or something similar to get started on
>> where to go from Nico's proof of concept. Please let me know if you want to
>> attend - I'm thinking sometime early next week.
>>
>
> Thanks for starting this. I will be happy to help. I can prepare an
> 'initial' plan to get us started.
>

Well.. I've started this wiki:
https://wiki.yoctoproject.org/wiki/Documentation_Sphinx


>
>
>>
>> Thanks,
>> -Mark M.
>>
>> > -----Original Message-----
>> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On
>> Behalf
>> > Of Robert P. J. Day
>> > Sent: Thursday, April 16, 2020 11:06 AM
>> > To: docs@lists.yoctoproject.org
>> > Subject: Re: [docs] Possible changes to the project docs
>> >
>> > On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
>> >
>> > >
>> > >
>> > > On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day <
>> rpjday@crashcourse.ca>
>> > wrote:
>> > >       On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
>> > >
>> > >       > As I put in one of my emails before you can use my dev branch:
>> > >       >
>> > >       >
>> https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx
>> > >       >
>> > >       > then it's just
>> > >       > pip3 install sphinx
>> > >       > # to use the non default theme
>> > >       > pip3 install sphinx_rtd_theme
>> > >       >
>> > >       > cd documentation make html
>> > >       >
>> > >       > and it should generate exactly that on your local folder
>> > >       > https://people.linaro.org/~nicolas.dechesne/yp-docs/
>> > >       >
>> > >       > I am happy to take patches in this branch (or create/maintain
>> a
>> > >       > contrib branch if more folks want to play/experiment and send
>> > >       > patches).
>> > >
>> > >         definitely need some mechanism to handle docbook entities and
>> basic
>> > >       tags like <filename> ... i'm still poring over pandoc, can it be
>> > >       configured to deal with that?
>> > >
>> > >         will go read more ...
>> > >
>> > >
>> > > It does 'most of the time'. See:
>> > > https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml
>> .
>> > > html#bsp-layers
>> > >
>> > > where the docbook source is:
>> > >        Each repository is a BSP layer supported by the Yocto Project
>> > >
>> > >
>> > >         (e.g. <filename>meta-raspberrypi</filename> and
>> > >
>> > >
>> > >         <filename>meta-intel</filename>).
>> > >
>> > >
>> > >  I am not sure if it always does the *right* thing though.. and I have
>> > > seen occurrences where it failed. I am wondering if we should 'fix'
>> > > pandoc , or just spend some time fixing the output of pandoc.
>> > > I don't think we will avoid reading/checking each manual, anyways..
>> > > I was thinking we could use pandoc for 80% of the work, some regex for
>> > > 15% and then manually finish the work.. it might be a bit optimistic
>> > > ;)
>> >
>> >   interesting ... if you go to the top-level page:
>> >
>> > https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp-
>> > guide.xml.html
>> >
>> > the <filename> tag in the third note is *not* migrated over, you can
>> still see
>> > the tag. i suspect there will be plenty of tweaking, but i'm still
>> totally on-board
>> > with this, and am willing to contribute.
>> >
>> > rday
>> 
>>
>

--000000000000e942ea05a68ac557
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2020 at 9:33 AM Nicol=
as Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dech=
esne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">hi Mark,<div><br></div><di=
v><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, May 21, 2020 at 10:42 PM Mark Morton &lt;<a href=3D"mailto:=
Mark.Morton@windriver.com" target=3D"_blank">Mark.Morton@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi:<b=
r>
<br>
I&#39;d like to actually start planning this conversion to Sphinx. So far =
myself, Rob D., Nicolas, and Tim O. are all interested in helping out.<br>
<br>
I&#39;d like to have a Zoom meeting or something similar to get started on=
 where to go from Nico&#39;s proof of concept. Please let me know if you wa=
nt to attend - I&#39;m thinking sometime early next week.<br></blockquote><=
div><br></div><div>Thanks for starting this. I will be happy to help. I can=
 prepare an &#39;initial&#39; plan to get us started.=C2=A0</div></div></di=
v></blockquote><div><br></div><div>Well.. I&#39;ve started this wiki:=C2=A0=
<a href=3D"https://wiki.yoctoproject.org/wiki/Documentation_Sphinx">https:/=
/wiki.yoctoproject.org/wiki/Documentation_Sphinx</a></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Thanks,<br>
-Mark M. <br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank=
">docs@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:docs@lists.yoctopro=
ject.org" target=3D"_blank">docs@lists.yoctoproject.org</a>&gt; On Behalf<b=
r>
&gt; Of Robert P. J. Day<br>
&gt; Sent: Thursday, April 16, 2020 11:06 AM<br>
&gt; To: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank">=
docs@lists.yoctoproject.org</a><br>
&gt; Subject: Re: [docs] Possible changes to the project docs<br>
&gt; <br>
&gt; On Thu, 16 Apr 2020, Nicolas Dechesne wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&g=
t;<br>
&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 16 Apr 2020, Nicolas Dechesne =
wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; As I put in one of my emails befo=
re you can use my dev branch:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://git.linaro.org=
/people/nicolas.dechesne/poky.git/log/?h=3Dsphinx" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=
=
=3Dsphinx</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; then it&#39;s just<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pip3 install sphinx<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; # to use the non default theme<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pip3 install sphinx_rtd_theme<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cd documentation make html<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; and it should generate exactly th=
at on your local folder<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://people.linaro.=
org/~nicolas.dechesne/yp-docs/" rel=3D"noreferrer" target=3D"_blank">https:=
//people.linaro.org/~nicolas.dechesne/yp-docs/</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am happy to take patches in thi=
s branch (or create/maintain a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; contrib branch if more folks want=
 to play/experiment and send<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; patches).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 definitely need some mechanism =
to handle docbook entities and basic<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tags like &lt;filename&gt; ... i&#39;m=
 still poring over pandoc, can it be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configured to deal with that?<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 will go read more ...<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; It does &#39;most of the time&#39;. See:<br>
&gt; &gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/b=
sp-guide/bsp.xml" rel=3D"noreferrer" target=3D"_blank">https://people.linar=
o.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml</a>.<br>
&gt; &gt; html#bsp-layers<br>
&gt; &gt;<br>
&gt; &gt; where the docbook source is:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 Each repository is a BSP layer suppor=
ted by the Yocto Project<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 (e.g. &lt;filename&gt;meta-raspberry=
pi&lt;/filename&gt; and<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;meta-intel&lt;/filen=
ame&gt;).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0I am not sure if it always does the *right* thing though..=
 and I have<br>
&gt; &gt; seen occurrences where it failed. I am wondering if we should &#=
39;fix&#39;<br>
&gt; &gt; pandoc , or just spend some time fixing the output of pandoc.<br=
>
&gt; &gt; I don&#39;t think we will avoid reading/checking each manual, an=
yways..<br>
&gt; &gt; I was thinking we could use pandoc for 80% of the work, some reg=
ex for<br>
&gt; &gt; 15% and then manually finish the work.. it might be a bit optimi=
stic<br>
&gt; &gt; ;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0interesting ... if you go to the top-level page:<br>
&gt; <br>
&gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-gu=
ide/bsp-" rel=3D"noreferrer" target=3D"_blank">https://people.linaro.org/~n=
icolas.dechesne/yp-docs/bsp-guide/bsp-</a><br>
&gt; guide.xml.html<br>
&gt; <br>
&gt; the &lt;filename&gt; tag in the third note is *not* migrated over, yo=
u can still see<br>
&gt; the tag. i suspect there will be plenty of tweaking, but i&#39;m stil=
l totally on-board<br>
&gt; with this, and am willing to contribute.<br>
&gt; <br>
&gt; rday<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000e942ea05a68ac557--

Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.2639.1585876611179971961
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 18:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ORqEsJnj;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id 7so5681363ill.2
        for <docs@lists.yoctoproject.org>; Thu, 02 Apr 2020 18:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=385mcNutMH0B3ZiRe+Vd4m0zwFiP1oWMF00pcMSILBo=;
        b=ORqEsJnjggbqf9syq7opP28OmYq4jw5Pv219LLThpx4OXPhsriyVIukVJ9U30H/n4C
         c/kJq3zoYGpeLrbg6oHA4eVmWbq6c0KPcgy5UxPZsIsGXodRyuNJBZJoMaq3S9bqqv0V
         F2iLoCv8UxI8mdJIYnUbFYqxbFZ3Owmr5rSDY4ZPqqtrh7ngsEX4eWR5Uodgup1TrOHI
         2rd8rUEVrmXAfuGP+T7BvnKdvMOauin503Xnox5BM6gFhw0Bt4+LH+DD7sRfFPTMd0uF
         vrP9N6/nTRhz4QBwz/Smnq1265OC9xk6G3xMmH5t9Zut7slGxnuTciykywjsJ1tnhDnc
         GYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=385mcNutMH0B3ZiRe+Vd4m0zwFiP1oWMF00pcMSILBo=;
        b=LefqVNvBu0SwfXYrZpso5auEYXxytYUZXvVio1z/+yZnTFoccdNbRN7Py63DNXXh+p
         PNccPIdSExaog3ew4+on36z43hfch4flqUXcqEBVHRVK76nXhA/X+yBoh6CEoDyI0pHw
         QpCKaSsajpusYTZB5R2uzsJU/AUMv5afYdJdImMPvg6ybAdVTJCaBNdQ+5hICiGOVWr7
         C+z+N0tODRmFOxxKXxDn0nS2FmRa+ssRKh7L26E0kcABnocyJYdgOsVVlYaqIbDutlir
         k+PVOEvaP2RTyQm0VlszroDVX/Sz8ayUT5RH4bUFZiw6EWeXaggvbSMUrTvKuKL8vErw
         xEKA==
X-Gm-Message-State: AGi0PubabM0QBVqvv4OMWASs+A0ypnKyGSS/QkmYJeV2kzhL4IbAVzMc
	hLz8PBUlFtSC8uhmVh0N1EY+GG8CFFtmBcpmmFnAdGYy
X-Google-Smtp-Source: APiQypK3DRx2P2bpF3P27urEyTCSn3fIN3L1kd3WHX1QRww8mTWegTkuFW6rpOkfuvh1Sd17bwgPCdomeXIzqI7VQfE=
X-Received: by 2002:a92:c00a:: with SMTP id q10mr6166027ild.151.1585876610357;
 Thu, 02 Apr 2020 18:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2004021701310.6665@localhost.localdomain>
 <a66c660c2c932861e23464a31fee0f886cf32b13.camel@linuxfoundation.org> <alpine.LFD.2.21.2004021705440.6858@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004021705440.6858@localhost.localdomain>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 2 Apr 2020 18:16:39 -0700
Message-ID: <CANx9H-CgA4L3yBw-q9HUMKbY63mO2vFnEXfe2+9_F+0jRFLLZg@mail.gmail.com>
Subject: Re: [docs] what is the deadline to get docs patches in before next release?
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000049c6d05a258ac38"

--000000000000049c6d05a258ac38
Content-Type: text/plain; charset="UTF-8"

Heads up that I just sent some changes that affect dev-manual, so once
those are in master-next you should rebase to that branch.

On Thu, Apr 2, 2020 at 2:06 PM rpjday@crashcourse.ca <rpjday@crashcourse.ca>
wrote:

> On Thu, 2 Apr 2020, Richard Purdie wrote:
>
> > On Thu, 2020-04-02 at 17:02 -0400, rpjday@crashcourse.ca wrote:
> > >   i have some time this weekend to do more editing, but only if
> > > there's a good chance that it gets in for the next official release;
> > > otherwise, it's not such a high priority.
> >
> > We tend to update the docs on the website fairly late in the
> > process, even after release as things develop on the stable branch
> > so I'd rate the chances of changes being visible as being good. We
> > have some tricky problems left to resolve too :(
>
>   thanks, that's useful to know ... working my way through the dev
> manual right now, i'll submit what i can.
>
> rday
> 
>

--000000000000049c6d05a258ac38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Heads up that I just sent some changes that affect d=
ev-manual, so once those are in master-next you should rebase to that branc=
h.</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Apr 2, 2020 at 2:06 PM <a href=3D"mailto:rpjday@crashc=
ourse.ca">rpjday@crashcourse.ca</a> &lt;<a href=3D"mailto:rpjday@crashcours=
e.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Thu, 2 Apr 2020, Richard Purdie wrote:<br>
<br>
&gt; On Thu, 2020-04-02 at 17:02 -0400, <a href=3D"mailto:rpjday@crashcour=
se.ca" target=3D"_blank">rpjday@crashcourse.ca</a> wrote:<br>
&gt; &gt;=C2=A0 =C2=A0i have some time this weekend to do more editing, bu=
t only if<br>
&gt; &gt; there&#39;s a good chance that it gets in for the next official =
release;<br>
&gt; &gt; otherwise, it&#39;s not such a high priority.<br>
&gt;<br>
&gt; We tend to update the docs on the website fairly late in the<br>
&gt; process, even after release as things develop on the stable branch<br=
>
&gt; so I&#39;d rate the chances of changes being visible as being good. W=
e<br>
&gt; have some tricky problems left to resolve too :(<br>
<br>
=C2=A0 thanks, that&#39;s useful to know ... working my way through the de=
v<br>
manual right now, i&#39;ll submit what i can.<br>
<br>
rday<br>
<br>
</blockquote></div></div>

--000000000000049c6d05a258ac38--

Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web09.2647.1614627098821928793
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Mar 2021 11:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pvYOb1Iu;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id u8so18994748ior.13
        for <docs@lists.yoctoproject.org>; Mon, 01 Mar 2021 11:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=dgF5ydCwzuJz6VEpitCvNk363cPOVutzve7ymOkXD3I=;
        b=pvYOb1IuOGIFOpMvKZzZzzvg0djqdSCJuTEdTHPTCWQHbi0dx1DMrvJtZTDAOSY7UK
         Nyb1WwmEAt781cGhpDYWbVXxIlLc8i34LEJpLuBqJTgVt7p+OKt5Pfq5x3JcDJ6Bhad9
         n19sD1KcihoEOkvQ5LTmb/5EnF7V64i2CMx1aDpN/gbSArxgF6srqkjF37J73f5PzcYS
         nVybfzBC928lgz0za4CMttxyDqA26+MKzkKNsV7joUg7yuO9jJ4aforVZP2uP1JYUTEd
         ryyEpClim3xRdPzes3ZgKJqsIIVRFNykfpcYXmIjyJOV+F5kaopDZEO/4qIbzuwcS2Ky
         twWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=dgF5ydCwzuJz6VEpitCvNk363cPOVutzve7ymOkXD3I=;
        b=KLnZWOeaqUCOgDjz6FMNNUfVDDKBI2RnELfvqyD9HiVjLZUvOn1ufpz+av91b/1D+x
         kQvqbdTyQ0obh2CDqcEBMF6/X9+EpGUHdNdoe77SXzVjlTamGwPmXhzLx10iSw9J9B9s
         VLbceCt/CvuN6ZkZ6yQtNBzzfxoVhBTC572LSnXAwJiVz4uUPF/Dy1B5XQaFwhwvE+G2
         GuPmgykun+nC0VysJral0A0E1OKVP4sroxCTKUmxXYe9OFgKaZkBOFG7OuPa3yadvPNk
         xpR9zrrYJxtmYHDwohYduH1QBbS45YDoB4NvhKrdDImOIPQZSrfKwNNTPp/m6zEvZEQN
         kGeQ==
X-Gm-Message-State: AOAM530y+EQECnC/NuDMznG+XU8VB/1//AmhdNoTf/bqvZTi39SSnNdN
	gXD/LrhRf4YpA0BtZGCIhBA7nynj2V/9xixHvdWWyIS4
X-Google-Smtp-Source: ABdhPJxTyx+PCfd8bjAzJwsFefzVpy5Wy4Zy8QmihrHL3rWvUwKIDjvKAuI23nSIlL3ixhMacekF4ZQfc/KWTPdMnDM=
X-Received: by 2002:a05:6602:1689:: with SMTP id s9mr5702891iow.171.1614627098057;
 Mon, 01 Mar 2021 11:31:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6e02:b46:0:0:0:0 with HTTP; Mon, 1 Mar 2021 11:31:37
 -0800 (PST)
Received: by 2002:a05:6e02:b46:0:0:0:0 with HTTP; Mon, 1 Mar 2021 11:31:37
 -0800 (PST)
In-Reply-To: <20210301181801.if2p5jftdyrjz6cs@qschulz>
References: <20210301154952.29473-1-dorindabassey@gmail.com> <20210301181801.if2p5jftdyrjz6cs@qschulz>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Mon, 1 Mar 2021 20:31:37 +0100
Message-ID: <CAJSnhzs9J9MMP0Y5OkmR=Rfw7xtaqnAVRunKfSf2EKuz1aYBQg@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual/common-task.rst: Added documentation for debuginfod support
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009fe14005bc7eaa29"

--0000000000009fe14005bc7eaa29
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,
Thanks for the review, noted your points and putting them into
consideration.

have
you compiled the docs with your patch? Does it render weird?
This was an oversight, I didn't know docs were compiled separately,
Currently looking at the documentation readme now.

About the PACKAGECONFIG_pn-elfutils-native in local.conf, the intent there
was for it to be an optional configuration option, since not everyone might
want to use a debuginfod server.

Thanks,
Dorinda.


On Mar 1, 2021 7:18 PM, "Quentin Schulz" <quentin.schulz@streamunlimited.com>
wrote:

Hi Dorinda,

Mainly nitpicks.

On Mon, Mar 01, 2021 at 04:49:52PM +0100, Dorinda wrote:
> Added documentation on running debuginfod server and using it on the
target.
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 46 ++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst
b/documentation/dev-manual/common-tasks.rst
> index 65db4aed33..d4a2b2f28d 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10023,7 +10023,51 @@ before starting the debugging process. These
extra computations place
>  more load on the target system and can alter the characteristics of the
>  program being debugged.
>
> -To help get past the previously mentioned constraints, you can use
> +To help get past the previously mentioned constraints, they're two

s/they're/there are/

> +methods you can use: running a debuginfod server and using gdbserver.
> +
> +Using the debuginfod server Method
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +

s/Method/method/

> +debuginfod from elfutils is a way to distribute debuginfo files.

I'd probably double tick quote debuginfod, debuginfo and elfutils.

> +running a debuginfod server makes debug symbols readily available,

s/running/Running/

Quoting debuginfod.

> +which means you don't need to download debugging information
> +and the binaries of the process being debugged. you can just fetch

s/you/You/

> +debug symbols from the server.
> +
> +1. To run a debuginfod server, you need to do the following:
> +
> +-  Ensure that this variable is set in your ``local.conf`` file:

Not sure a numbered item list followed by a "simple" list works fine, have
you compiled the docs with your patch? Does it render weird?

Thinking about it, you might be missing a three space indentation on the
"simple" list?

Just throwing out my lack of knowledge in the conversation right now :D

> +   ::
> +
> +      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
> +
> +    This PACKAGECONFIG option enables debuginfod and libdebuginfod for

s/PACKAGECONFIG/:term:`PACKAGECONFIG`/

Quoting debuginfod and libdebuginfod.

I've missed most of the discussion around debuginfo feature/support so
forgive me if it's complete non-sense, but... do we really want to tell
people to put PACKAGECONFIG_pn-elfutils-native in their local.conf
instead of creating a bbappend for elfutils in their own layer? Or add
that line to their distro conf file and not local.conf?

For me, local.conf is for temporary use but it might make sense for some
people/company to always have debuginfo enabled in their builds?

Just asking, being curious right now :)

> +    elfutils-native.
> +
> +-  Run the following commands to set up the debuginfod server:

Quoting debuginfod and elfutils-native.

> +   ::
> +
> +      $ oe-debuginfod

Probably missing at least a newline if not two to end the code blocks
IIRC from my experience.

> +2. To use debuginfod on the target, you need the following:
> +
> +-  Ensure that these variable is set in your ``local.conf`` file:

s/these/this/

> +   ::
> +
> +      DEBUGINFOD_URLS = "http://localhost:port"
> +
> +   This option does the client configuration by setting DEBUGINFOD_URLS

I'd add an entry in the variable glossary for DEBUGINFOD_URLS and then:
s/DEBUGINFOD_URLS/:term:`DEBUGINFOD_URLS`/

> +   to point at the server running debuginfod. Such that for every
lookup,
> +   the debuginfod client will query the server and return the requested
information.
> +   ::
> +
> +        PACKAGECONFIG_pn-gdb = "debuginfod"
> +
> +   This PACKAGECONFIG option enables debuginfod for gdb.

s/PACKAGECONFIG/:term:`PACKAGECONFIG`/

Quoting debuginfod and gdb the few instances above.

> +
> +Using the gdbserver Method
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +

s/Method/method/

Thanks,
Quentin

--0000000000009fe14005bc7eaa29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto">Hi Quentin,</div>Thanks for the re=
view, noted your points and putting them into consideration.=C2=A0<div dir=
=3D"auto"><br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif=
">have</span><br style=3D"font-family:sans-serif"><span style=3D"font-famil=
y:sans-serif">you compiled the docs with your patch? Does it render weird?<=
/span><br><div dir=3D"auto">This was an oversight, I didn&#39;t know docs w=
ere compiled separately, Currently looking at the documentation readme now.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">About the PACKAGECONFIG=
_pn-elfutils-native in local.conf, the intent there was for it to be an opt=
ional configuration option, since not everyone might want to use a debuginf=
od server.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div>=
<div dir=3D"auto">Dorinda.</div></div><br><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Mar 1, 2021 7:18 PM, &quot;Quentin Schulz&quot;=
 &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz@s=
treamunlimited.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=
=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi Dorinda,<br>
<br>
Mainly nitpicks.<br>
<div class=3D"quoted-text"><br>
On Mon, Mar 01, 2021 at 04:49:52PM +0100, Dorinda wrote:<br>
&gt; Added documentation on running debuginfod server and using it on the t=
arget.<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmai=
l.com">dorindabassey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/dev-manual/<wbr>common-tasks.rst | 46 ++++++++++++=
++++++++++-<br>
&gt;=C2=A0 1 file changed, 45 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/documentation/dev-manual/<wbr>common-tasks.rst b/document=
ation/dev-manual/<wbr>common-tasks.rst<br>
&gt; index 65db4aed33..d4a2b2f28d 100644<br>
&gt; --- a/documentation/dev-manual/<wbr>common-tasks.rst<br>
&gt; +++ b/documentation/dev-manual/<wbr>common-tasks.rst<br>
&gt; @@ -10023,7 +10023,51 @@ before starting the debugging process. These =
extra computations place<br>
&gt;=C2=A0 more load on the target system and can alter the characteristics=
 of the<br>
&gt;=C2=A0 program being debugged.<br>
&gt;=C2=A0 <br>
&gt; -To help get past the previously mentioned constraints, you can use<br=
>
&gt; +To help get past the previously mentioned constraints, they&#39;re tw=
o<br>
<br>
</div>s/they&#39;re/there are/<br>
<div class=3D"quoted-text"><br>
&gt; +methods you can use: running a debuginfod server and using gdbserver.=
<br>
&gt; +<br>
&gt; +Using the debuginfod server Method<br>
&gt; +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~<br>
&gt; +<br>
<br>
</div>s/Method/method/<br>
<div class=3D"quoted-text"><br>
&gt; +debuginfod from elfutils is a way to distribute debuginfo files.<br>
<br>
</div>I&#39;d probably double tick quote debuginfod, debuginfo and elfutils=
.<br>
<div class=3D"quoted-text"><br>
&gt; +running a debuginfod server makes debug symbols readily available,<br=
>
<br>
</div>s/running/Running/<br>
<br>
Quoting debuginfod.<br>
<div class=3D"quoted-text"><br>
&gt; +which means you don&#39;t need to download debugging information<br>
&gt; +and the binaries of the process being debugged. you can just fetch<br=
>
<br>
</div>s/you/You/<br>
<div class=3D"quoted-text"><br>
&gt; +debug symbols from the server.<br>
&gt; +<br>
&gt; +1. To run a debuginfod server, you need to do the following:<br>
&gt; +<br>
&gt; +-=C2=A0 Ensure that this variable is set in your ``local.conf`` file:=
<br>
<br>
</div>Not sure a numbered item list followed by a &quot;simple&quot; list w=
orks fine, have<br>
you compiled the docs with your patch? Does it render weird?<br>
<br>
Thinking about it, you might be missing a three space indentation on the<br=
>
&quot;simple&quot; list?<br>
<br>
Just throwing out my lack of knowledge in the conversation right now :D<br>
<div class=3D"quoted-text"><br>
&gt; +=C2=A0 =C2=A0::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG_pn-elfutils-<wbr>native =3D &quot;=
debuginfod libdebuginfod&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 This PACKAGECONFIG option enables debuginfod and libdeb=
uginfod for<br>
<br>
</div>s/PACKAGECONFIG/:term:`<wbr>PACKAGECONFIG`/<br>
<br>
Quoting debuginfod and libdebuginfod.<br>
<br>
I&#39;ve missed most of the discussion around debuginfo feature/support so<=
br>
forgive me if it&#39;s complete non-sense, but... do we really want to tell=
<br>
people to put PACKAGECONFIG_pn-elfutils-<wbr>native in their local.conf<br>
instead of creating a bbappend for elfutils in their own layer? Or add<br>
that line to their distro conf file and not local.conf?<br>
<br>
For me, local.conf is for temporary use but it might make sense for some<br=
>
people/company to always have debuginfo enabled in their builds?<br>
<br>
Just asking, being curious right now :)<br>
<div class=3D"quoted-text"><br>
&gt; +=C2=A0 =C2=A0 elfutils-native.<br>
&gt; +<br>
&gt; +-=C2=A0 Run the following commands to set up the debuginfod server:<b=
r>
<br>
</div>Quoting debuginfod and elfutils-native.<br>
<div class=3D"quoted-text"><br>
&gt; +=C2=A0 =C2=A0::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 $ oe-debuginfod<br>
<br>
</div>Probably missing at least a newline if not two to end the code blocks=
<br>
IIRC from my experience.<br>
<div class=3D"quoted-text"><br>
&gt; +2. To use debuginfod on the target, you need the following:<br>
&gt; +<br>
&gt; +-=C2=A0 Ensure that these variable is set in your ``local.conf`` file=
:<br>
<br>
</div>s/these/this/<br>
<div class=3D"quoted-text"><br>
&gt; +=C2=A0 =C2=A0::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 DEBUGINFOD_URLS =3D &quot;http://localhost:port&=
quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0This option does the client configuration by setting DEB=
UGINFOD_URLS <br>
<br>
</div>I&#39;d add an entry in the variable glossary for DEBUGINFOD_URLS and=
 then:<br>
s/DEBUGINFOD_URLS/:term:`<wbr>DEBUGINFOD_URLS`/<br>
<div class=3D"quoted-text"><br>
&gt; +=C2=A0 =C2=A0to point at the server running debuginfod. Such that for=
 every lookup, <br>
&gt; +=C2=A0 =C2=A0the debuginfod client will query the server and return t=
he requested information.<br>
&gt; +=C2=A0 =C2=A0::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG_pn-gdb =3D &quot;debuginfod=
&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0This PACKAGECONFIG option enables debuginfod for gdb.<br=
>
<br>
</div>s/PACKAGECONFIG/:term:`<wbr>PACKAGECONFIG`/<br>
<br>
Quoting debuginfod and gdb the few instances above.<br>
<div class=3D"quoted-text"><br>
&gt; +<br>
&gt; +Using the gdbserver Method<br>
&gt; +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~<br>
&gt; +<br>
<br>
</div>s/Method/method/<br>
<br>
Thanks,<br>
Quentin<br>
</blockquote></div><br></div></div></div>

--0000000000009fe14005bc7eaa29--

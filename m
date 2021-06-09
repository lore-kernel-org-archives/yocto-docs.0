Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.5790.1623233522709778113
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 03:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ElOLeUWr;
 spf=pass (domain: linaro.org, ip: 209.85.218.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f41.google.com with SMTP id g8so37640287ejx.1
        for <docs@lists.yoctoproject.org>; Wed, 09 Jun 2021 03:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sgkq6Np0B5I1f2xpy7CGci4ZyDNdrTQBNjeEzsq5syU=;
        b=ElOLeUWrPYz7KoabO0MNkVqoYpRhMyWAuQnCxake4Eh2CldJLjYDxyAYrLmgiPevbI
         uVx+3F1vCgSOPPKa4wnkJJmb33T8Iby1/X/Fq88436OKewnLu7FZKzZF+VEL4vyaMZKK
         MD17Xs8nv1NIvG7g9sh4pU78/Fnv+EYcQQWfKOJp0KgElQDvGlqR576oR1Q7J9fLd8PH
         tykPjcG5WZQaGuY37BhcxJ+gE78CFyLtnEH0uDDs7r/iIvblH1UT9LIo6QP3e/YUil5Q
         RFW7fGjOM8pIdeFOPAUZx2kE+FY+bTIG/rtMzmaHi3LvtKU9wlVtC8E6kPsLZktO2URh
         yd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sgkq6Np0B5I1f2xpy7CGci4ZyDNdrTQBNjeEzsq5syU=;
        b=nbv1+qZYDQ2EM1ewCXlABXQlcgHmsFNfiT6xsgs8EjeycLcauoSRzZnT+4UETb1o5l
         fgZSWiaJPrZv2vhnaB+YcyZJ/VRhODVKy2L+GekqKGQiwrfofcNpdD0X80MBzF6jbAik
         +BokPjUt/Pnn3XsECHZJh8vD1g+wjzMIVGkVsHecAjhBX49Quz7M87C+R81VXossRYm4
         Qa9kEWlB0flG9PTPzk96Q4PkT4LOBWzQ+zDUu+ZavWqnrHJDYE7F4Xfn4y+derSGW711
         RSBgkIxQnLmJyo35akZXUanWlQ7y42j4kmrzSh4w5a4VbSMwwFY8eMFk3ORd8BAcQjov
         H2Rw==
X-Gm-Message-State: AOAM533WMvqraoVjF4SkEeXiSq3I0rGagQ169LJ0K4j2tCyQ473Fad6m
	ULQsqFz3Zs4NfVhW+KYrGkfsVl3Fs1nup/f3g5KjVg==
X-Google-Smtp-Source: ABdhPJykd1yiZcVArT4GZfjekflFaxijyG3ZXkDTj1hAIuVhcTMIE4yUZVc8cdqkIKmkWMRLjDKl7sKCdwQG/Nb/DQI=
X-Received: by 2002:a17:906:c0c6:: with SMTP id bn6mr26867834ejb.436.1623233521080;
 Wed, 09 Jun 2021 03:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210608090255.3089963-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210608090255.3089963-1-richard.purdie@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 9 Jun 2021 12:11:50 +0200
Message-ID: <CAP71Wjz00a3yyG30f3s9zMU3yKFHRDQb_DWP5frdG=NabKTx9A@mail.gmail.com>
Subject: Re: [docs] [PATCH] test-manual: Add initial YP Compatible documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000069750805c452813d"

--00000000000069750805c452813d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks Richard for sending this out. A first review with some minor nits.

On Tue, Jun 8, 2021 at 11:02 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We need to document the Yocto Project Compatible badging programme. This
> adds an initial piece of documentation about it from which we can improv=
e
> as needed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/test-manual/index.rst           |  1 +
>  .../test-manual/yocto-project-compatible.rst  | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 documentation/test-manual/yocto-project-compatible.r=
st
>
> diff --git a/documentation/test-manual/index.rst
> b/documentation/test-manual/index.rst
> index d122b5e27..4c590a6aa 100644
> --- a/documentation/test-manual/index.rst
> +++ b/documentation/test-manual/index.rst
> @@ -14,6 +14,7 @@ Yocto Project Test Environment Manual
>     test-process
>     understand-autobuilder
>     reproducible-builds
> +   yocto-project-compatible
>     history
>
>  .. include:: /boilerplate.rst
> diff --git a/documentation/test-manual/yocto-project-compatible.rst
> b/documentation/test-manual/yocto-project-compatible.rst
> new file mode 100644
> index 000000000..372b701bc
> --- /dev/null
> +++ b/documentation/test-manual/yocto-project-compatible.rst
> @@ -0,0 +1,52 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +************************
> +Yocto Project Compatible
> +************************
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +After the introduction of layers to OpenEmbedded, it quickly became cle=
ar
> that some layers were popular and worked well, others developed a
> reputation for being 'problematic'. Those were layers which didn't
> inter-operate well with other layers and tended to assume they controlle=
d
> all the aspects of the end resulting output. This isn't usually intentio=
nal
> but because they're often developed by developers with a particular focu=
s
> (e.g. a company's BSP) whilst the end users have a different focus (e.g.
> integrating that BSP into a product).
> +
> +As a result of noticing patterns like this and friction between layers,
> the project developed the "Yocto Project Compatible" badge programme whe=
re
> layers modelling the best known practises could be marked as being widel=
y
> compatible with other layers. This takes the form of a set of yes/no bin=
ary
> answer questions where layers can declare if they have met the appropria=
te
> criteria. In the second version of the programme, a script was added to
> make validation easier and clearer, the script is called
> 'yocto-check-layer' and is available in OpenEmbedded-Core.
>

Insert link to
https://docs.yoctoproject.org/dev-manual/common-tasks.html?layer#making-su=
re-your-layer-is-compatible-with-yocto-project


> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +Benefits
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The OpenEmbedded Layer model is powerful and flexible, it gives users t=
he
> ultimate power to change pretty much any aspect of the system but as wit=
h
> most things, power comes with responsibility. The Yocto Project would li=
ke
> to see people able to mix and match BSPs with distro configs or software
> stacks and be able to merge these together such that the result
> inter-operates well together. Over time, the project has realised that
> there were things that work well in layers to allow them to operate
> together. There were also 'anti-patterns' which stopped layers working w=
ell
> together.
> +
> +The intent of the compatibility programme is simple, if the layer passe=
s
> the compatibility tests, it is considered =E2=80=9Cwell behaved=E2=80=9D=
 and should operate
> and cooperate well with other compatible layers.
> +
> +The benefits of compatibility apply from multiple different user and
> member perspectives. From a hardware perspective (a BSP layer),
> compatibility means the hardware can be used in many different products =
and
> use cases without impacting the software stacks being run with it. For a
> company developing a product, compatibility gives you a
> specification/standard you can require in a contract and then know it wi=
ll
> have certain desired characteristics for interoperability. It also puts
> constraints on how invasive these code bases are into the rest of the
> system, meaning that multiple different separate hardware support layers
> can coexist (e.g. for multiple product lines from different manufacturer=
s).
> This can also influence how easily those system components might be
> upgraded or maintained for security purposes by one or more parties duri=
ng
> the lifecycle of a product through development and widespread use.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Validating a layer
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The badges are available to members of the project or open source
> projects run on a non-commercial basis and are tried to the project memb=
er
> level as a member benefit but anyone can answer the questions and run th=
e
> script.
>

tried -> tied


> +
> +The project encourages all layer maintainers to consider the questions
> and the output from the script against their layer as there are often
> unintentional consequences of the way some layers are constructed and th=
e
> questions and script are designed to highlight commonly known issues whi=
ch
> can often easily be solved leading to easier and wider layer use.
> +
> +It is intended that over time, the tests will evolve as best known
> practices are identified and as new interoperability issues are identifi=
ed
> which unnecessarily restrict layer interoperability. If anyone becomes
> aware of either issue, please do mention it to the project (in our tech
> calls, on the mailing list or to the TSC). The TSC is holds overall
> responsibility for the technical criteria used by the programme.
>

is holds -> holds


> +
> +Layers are divided into three types:
> +
> +* "BSP" or "hardware support" layers contain support for particular
> pieces of hardware. This would include kernel and boot loader
> configuration, any recipes needed for firmware/modules needed for the
> hardware. They would usually correspond to a MACHINE setting.
> +
> +* "distro" layers defined as layers providing configuration options and
> settings such as a choice of init system, compiler/optimisation options =
or
> configuration and choices of software components. This would usually
> correspond to a DSITRO setting.
>

DISTRO


> +
> +* "software" layers are usually recipes. A layer might target a
> particular graphical UI or software stack component.
> +
> +Key best practises the programme tries to encourage:
> +
> +* A layer should clearly show who maintains it, where change submission=
s
> and bug reports should be sent
> +* Where multiple types of functionality are present, the layer be
> internally subdivided into layers to separate these components as users
> would likely want to use only one of them and separability is a key best
> practise.
>

the layer be -> the layer should be?


> +* Adding a layer to a build should not change that build without the us=
er
> taking some additional step of configuration to active the layer (such a=
s
> selecting a MACHINE, a DISTRO or a DISTRO_FEATURE)
> +
> +The project does test the compatibility status of the core project laye=
rs
> on the project autobuilder.
> +
> +The official form to submit compatibility requests with is at
> https://www.yoctoproject.org/ecosystem/branding/compatible-registration/=
.
> Successful applicants can display the appropraiate badge which would be
> provided to them on success of the application.
>

:yocto_home:` xxx `


> +
> --
> 2.30.2
>
>
>=20
>
>

--00000000000069750805c452813d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>thanks Richard for sending this out. A first review=
=C2=A0with some minor nits.=C2=A0</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 8, 2021 at 11:02 AM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">We need to document the Yocto Project Compatible bad=
ging programme. This<br>
adds an initial piece of documentation about it from which we can improve<=
br>
as needed.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0documentation/test-manual/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../test-manual/yocto-project-compatible.rst=C2=A0 | 52 ++++++++++++=
+++++++<br>
=C2=A02 files changed, 53 insertions(+)<br>
=C2=A0create mode 100644 documentation/test-manual/yocto-project-compatibl=
e.rst<br>
<br>
diff --git a/documentation/test-manual/index.rst b/documentation/test-manu=
al/index.rst<br>
index d122b5e27..4c590a6aa 100644<br>
--- a/documentation/test-manual/index.rst<br>
+++ b/documentation/test-manual/index.rst<br>
@@ -14,6 +14,7 @@ Yocto Project Test Environment Manual<br>
=C2=A0 =C2=A0 test-process<br>
=C2=A0 =C2=A0 understand-autobuilder<br>
=C2=A0 =C2=A0 reproducible-builds<br>
+=C2=A0 =C2=A0yocto-project-compatible<br>
=C2=A0 =C2=A0 history<br>
<br>
=C2=A0.. include:: /boilerplate.rst<br>
diff --git a/documentation/test-manual/yocto-project-compatible.rst b/docu=
mentation/test-manual/yocto-project-compatible.rst<br>
new file mode 100644<br>
index 000000000..372b701bc<br>
--- /dev/null<br>
+++ b/documentation/test-manual/yocto-project-compatible.rst<br>
@@ -0,0 +1,52 @@<br>
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK<br>
+<br>
+************************<br>
+Yocto Project Compatible<br>
+************************<br>
+<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+Introduction<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+After the introduction of layers to OpenEmbedded, it quickly became clear=
 that some layers were popular and worked well, others developed a reputati=
on for being &#39;problematic&#39;. Those were layers which didn&#39;t inte=
r-operate well with other layers and tended to assume they controlled all t=
he aspects of the end resulting output. This isn&#39;t usually intentional =
but because they&#39;re often developed by developers with a particular foc=
us (e.g. a company&#39;s BSP) whilst the end users have a different focus (=
e.g. integrating that BSP into a product).<br>
+<br>
+As a result of noticing patterns like this and friction between layers, t=
he project developed the &quot;Yocto Project Compatible&quot; badge program=
me where layers modelling the best known practises could be marked as being=
 widely compatible with other layers. This takes the form of a set of yes/n=
o binary answer questions where layers can declare if they have met the app=
ropriate criteria. In the second version of the programme, a script was add=
ed to make validation easier and clearer, the script is called &#39;yocto-c=
heck-layer&#39; and is available in OpenEmbedded-Core.<br></blockquote><div=
><br></div><div>Insert link to=C2=A0<a href=3D"https://docs.yoctoproject.or=
g/dev-manual/common-tasks.html?layer#making-sure-your-layer-is-compatible-w=
ith-yocto-project">https://docs.yoctoproject.org/dev-manual/common-tasks.ht=
ml?layer#making-sure-your-layer-is-compatible-with-yocto-project</a></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=3D=3D=3D=3D=3D=3D=3D=3D<br>
+Benefits<br>
+=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+The OpenEmbedded Layer model is powerful and flexible, it gives users the=
 ultimate power to change pretty much any aspect of the system but as with =
most things, power comes with responsibility. The Yocto Project would like =
to see people able to mix and match BSPs with distro configs or software st=
acks and be able to merge these together such that the result inter-operate=
s well together. Over time, the project has realised that there were things=
 that work well in layers to allow them to operate together. There were als=
o &#39;anti-patterns&#39; which stopped layers working well together.<br>
+<br>
+The intent of the compatibility programme is simple, if the layer passes =
the compatibility tests, it is considered =E2=80=9Cwell behaved=E2=80=9D an=
d should operate and cooperate well with other compatible layers.<br>
+<br>
+The benefits of compatibility apply from multiple different user and memb=
er perspectives. From a hardware perspective (a BSP layer), compatibility m=
eans the hardware can be used in many different products and use cases with=
out impacting the software stacks being run with it. For a company developi=
ng a product, compatibility gives you a specification/standard you can requ=
ire in a contract and then know it will have certain desired characteristic=
s for interoperability. It also puts constraints on how invasive these code=
 bases are into the rest of the system, meaning that multiple different sep=
arate hardware support layers can coexist (e.g. for multiple product lines =
from different manufacturers). This can also influence how easily those sys=
tem components might be upgraded or maintained for security purposes by one=
 or more parties during the lifecycle of a product through development and =
widespread use.<br>
+<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+Validating a layer<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+The badges are available to members of the project or open source project=
s run on a non-commercial basis and are tried to the project member level a=
s a member benefit but anyone can answer the questions and run the script.<=
br></blockquote><div><br></div><div>tried -&gt; tied</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+The project encourages all layer maintainers to consider the questions an=
d the output from the script against their layer as there are often uninten=
tional consequences of the way some layers are constructed and the question=
s and script are designed to highlight commonly known issues which can ofte=
n easily be solved leading to easier and wider layer use.<br>
+<br>
+It is intended that over time, the tests will evolve as best known practi=
ces are identified and as new interoperability issues are identified which =
unnecessarily restrict layer interoperability. If anyone becomes aware of e=
ither issue, please do mention it to the project (in our tech calls, on the=
 mailing list or to the TSC). The TSC is holds overall responsibility for t=
he technical criteria used by the programme.<br></blockquote><div><br></div=
><div>is holds -&gt; holds</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+<br>
+Layers are divided into three types:<br>
+<br>
+* &quot;BSP&quot; or &quot;hardware support&quot; layers contain support =
for particular pieces of hardware. This would include kernel and boot loade=
r configuration, any recipes needed for firmware/modules needed for the har=
dware. They would usually correspond to a MACHINE setting.<br>
+<br>
+* &quot;distro&quot; layers defined as layers providing configuration opt=
ions and settings such as a choice of init system, compiler/optimisation op=
tions or configuration and choices of software components. This would usual=
ly correspond to a DSITRO setting.<br></blockquote><div><br></div><div>DIST=
RO</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+* &quot;software&quot; layers are usually recipes. A layer might target a=
 particular graphical UI or software stack component.<br>
+<br>
+Key best practises the programme tries to encourage:<br>
+<br>
+* A layer should clearly show who maintains it, where change submissions =
and bug reports should be sent<br>
+* Where multiple types of functionality are present, the layer be interna=
lly subdivided into layers to separate these components as users would like=
ly want to use only one of them and separability is a key best practise.<br=
></blockquote><div><br></div><div>the layer be -&gt; the layer should be?=
=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+* Adding a layer to a build should not change that build without the user=
 taking some additional step of configuration to active the layer (such as =
selecting a MACHINE, a DISTRO or a DISTRO_FEATURE)<br>
+<br>
+The project does test the compatibility status of the core project layers=
 on the project autobuilder.<br>
+<br>
+The official form to submit compatibility requests with is at <a href=3D"=
https://www.yoctoproject.org/ecosystem/branding/compatible-registration/" r=
el=3D"noreferrer" target=3D"_blank">https://www.yoctoproject.org/ecosystem/=
branding/compatible-registration/</a>. Successful applicants can display th=
e appropraiate badge which would be provided to them on success of the appl=
ication.<br></blockquote><div><br></div><div>:yocto_home:` xxx `</div><div>=
=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000069750805c452813d--

Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1312FC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 11:56:50 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.7226.1651060608622474450
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iS+5rOas;
 spf=pass (domain: linaro.org, ip: 209.85.219.182,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id f38so2931032ybi.3
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=73Zb3quinPpZTXV8XXrbohzDO0VA4kdaeVJYzA5UCvE=;
        b=iS+5rOas7bWG2JYrBS6OS6pP1rWZCOp6kFoVhckVWCfKofk84Puu09y+FSY7WULYrM
         X1QO43kwwDvrJdeCYn+3QOowWMQ4sFODSMOZQFXfj88x/VTI+RzHy1wxkLIv94r2seFi
         QVNB49zFSHCJPwUpmPvSQaFBp/G1nO4Ux5/yyjcMxg/VJeeYXsKP/zF3szoPeeN+sOg2
         j1ptW9KvBQ/jYQ9pDe9cribosbw8xEmsVQs3oaMu6c6ZuQ04q8i917ZVSV2FWtnQNZSy
         GWWaOl9Jfu8lPm+GOKiCd4tpGe0qBHlwGkT4/Lt613uVXMfTflQjSCzEuPi3RCuJ47ch
         hNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=73Zb3quinPpZTXV8XXrbohzDO0VA4kdaeVJYzA5UCvE=;
        b=6N2Q2qRNsDN7UhxLQ0yMyiVetl+BOnd/PiNepnkTmjazknE+6bh1YGrkq6KrZqCiEg
         2Qr6YrCEhyoOkkunPmRIyWCaqduaNucab3ntUmOLhtjJdyjcJcgAmegFwSsOfpDkwge/
         C+TbCa5aNC2fEF2Go1bbMRNMI2KJBbt65f/vzmHsxrAO3WbvvpyDdnybz4SUEkYUWGih
         sgOwHpUq+qwenuBsDzoxwacFNpLC+x4gV9iMhBexsXoB7WsR1bz/pOwfShmZGbUT4OMZ
         x+YVT3/9V1ClLzbbETGhijscKN8HuCjdWdD4BClRMGeB4C2+gXdI0JXvJ5BMmIC13zMJ
         Q1Bg==
X-Gm-Message-State: AOAM531DdotgswAtnXa/qR/uzISuHfQXUaMPeRJoUHW2vQXkq4FzbnbP
	7loRHb9LaVS3gmJkOxSVb8y0FrtTZHGqADIgH+dZ7g==
X-Google-Smtp-Source: 
 ABdhPJzubi+zpEKd/GrS96ueATVdoat0Vud/IybtJLNaIQJ96CY+pLZeqtzZNZDmjx1UrBq0E+vRo74KbAGvbyqGVLk=
X-Received: by 2002:a25:d3cf:0:b0:645:d937:747b with SMTP id
 e198-20020a25d3cf000000b00645d937747bmr21564305ybf.383.1651060607695; Wed, 27
 Apr 2022 04:56:47 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DM5PR1101MB236176E376BD554365050E72B9FA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
 <90b05148-5215-584e-0080-24cd411b2ba8@sancloud.com>
 <CANPvuR=Sp+tuOAmFRzw207e_1+jNzOyR1AST9J=jh7_KgsOS2Q@mail.gmail.com>
 <9790963d-0e8d-c713-cc97-ab6f8ca4fef3@bootlin.com>
 <CAP71Wjw=OL8e=EqgPaLfPbQisTeFuVE2FkXq7+M9nWKckK4Y_Q@mail.gmail.com>
 <CAP71WjwG2PCT=ceuZpBmeF-Xzn9yVQi1PG2+d6+wRjouoAZ0Aw@mail.gmail.com>
In-Reply-To: 
 <CAP71WjwG2PCT=ceuZpBmeF-Xzn9yVQi1PG2+d6+wRjouoAZ0Aw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 27 Apr 2022 13:56:36 +0200
Message-ID: 
 <CAP71WjzkiGLiJk7PPz0jkd1gfo9Ru36+zHxk6xRUp1Hch-Zi8g@mail.gmail.com>
Subject: Re: [docs] [yocto] [ANNOUNCEMENT] Yocto Project 4.0 is Released
To: michael.opdenacker@bootlin.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
 Paul Barker <paul.barker@sancloud.com>,
	"Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000006507705dda181cc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 11:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2886

--00000000000006507705dda181cc
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 1:27 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
> On Wed, Apr 27, 2022 at 1:17 PM Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>
>>
>>
>> On Wed, Apr 27, 2022 at 10:59 AM Michael Opdenacker via
>> lists.yoctoproject.org <michael.opdenacker=
>> bootlin.com@lists.yoctoproject.org> wrote:
>>
>>>
>>> On 4/27/22 10:18, Jose Quaresma wrote:
>>> >
>>> >
>>> > In the HTML page it is fine, the &YOCTO_DOC_VERSION is 4.0
>>> >
>>> https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>>> >
>>> > In the dev version the &YOCTO_DOC_VERSION is not replaced by dev
>>> >
>>> https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>>>
>>>
>>> That's *very weird* because the substitution happened in
>>> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html but
>>> not in
>>>
>>> https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>>> (same version).
>>>
>>> When I build the docs locally things look fine. Any ideas what could
>>> cause this?
>>>
>>
>> I can reproduce the issue when building locally. I am using Sphinx==4.4.0
>>
>
> oh... It's because the file release-notes-4.0.rst is included with a
> ..include statement. The variable mapping is done with a custom Sphinx
> extension (yocto-vars.py) which is triggered for the 'source-read' event.
> So perhaps this event is not triggered when using an include statement..
> let me check more on that..
>

yes, that seems correct. I don't think we should continue to use the
include directive here. Since you try to make one section (for 3.4 and 4.0)
with the migration and the release notes, I think something along these
lines would work, maybe there is simpler..


diff --git a/documentation/migration-guides/index.rst
b/documentation/migration-guides/index.rst
index 20c6ab9d4..4597506d0 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,8 +12,8 @@ to move to one release of the Yocto Project from the
previous one.
 .. toctree::

    migration-general
-   migration-4.0
-   migration-3.4
+   release-4.0
+   release-3.4
    migration-3.3
    migration-3.2
    migration-3.1
diff --git a/documentation/migration-guides/migration-3.4.rst
b/documentation/migration-guides/migration-3.4.rst
index c22ea814d..d57c955eb 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -1,6 +1,3 @@
-Release 3.4 (honister)
-======================
-
 Migration notes for 3.4 (honister)
 ----------------------------------

@@ -274,6 +271,3 @@ Miscellaneous
   examples in :term:`EXTRA_USERS_PARAMS`.


-.. include:: release-notes-3.4.rst
-.. include:: release-notes-3.4.1.rst
-.. include:: release-notes-3.4.2.rst
diff --git a/documentation/migration-guides/migration-4.0.rst
b/documentation/migration-guides/migration-4.0.rst
index d737b9d43..a8e6b4c33 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -265,5 +265,3 @@ Miscellaneous changes
   when parsing recipes. Any code depending on the previous behaviour will
no longer
   work - change any such code to explicitly use appropriate path variables
instead.

-
-.. include:: release-notes-4.0.rst
diff --git a/documentation/migration-guides/release-3.4.rst
b/documentation/migration-guides/release-3.4.rst
new file mode 100644
index 000000000..81476c4ad
--- /dev/null
+++ b/documentation/migration-guides/release-3.4.rst
@@ -0,0 +1,10 @@
+Release 3.4 (honister)
+======================
+
+.. toctree::
+
+   migration-3.4
+   release-notes-3.4
+   release-notes-3.4.1
+   release-notes-3.4.2
+
diff --git a/documentation/migration-guides/release-4.0.rst
b/documentation/migration-guides/release-4.0.rst
new file mode 100644
index 000000000..7062f9d24
--- /dev/null
+++ b/documentation/migration-guides/release-4.0.rst
@@ -0,0 +1,7 @@
+Release 4.0 (kirkstone)
+=======================
+
+.. toctree::
+
+   migration-4.0
+   release-notes-4.0


>
>>
>>>
>>> Michael.
>>>
>>> --
>>> Michael Opdenacker, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#2876):
>>> https://lists.yoctoproject.org/g/docs/message/2876
>>> Mute This Topic: https://lists.yoctoproject.org/mt/90726109/1279857
>>> Group Owner: docs+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>>> nicolas.dechesne@linaro.org]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>>

--00000000000006507705dda181cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 1:27 PM Nicol=
as Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dech=
esne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022=
 at 1:17 PM Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.=
org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Apr 27, 2022 at 10:59 AM Michael Opdenacker via <a hre=
f=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.or=
g</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.yoctopro=
ject.org" target=3D"_blank">bootlin.com@lists.yoctoproject.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 4/27/22 10:18, Jose Quaresma wrote:<br>
&gt;<br>
&gt; =C2=A0<br>
&gt; In the HTML page it is fine, the &amp;YOCTO_DOC_VERSION is 4.0<br>
&gt; <a href=3D"https://docs.yoctoproject.org/4.0/migration-guides/migratio=
n-4.0.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_b=
lank">https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html=
#release-notes-for-4-0-kirkstone</a><br>
&gt;<br>
&gt; In the dev version the &amp;YOCTO_DOC_VERSION is not replaced by dev<b=
r>
&gt; <a href=3D"https://docs.yoctoproject.org/dev/migration-guides/migratio=
n-4.0.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_b=
lank">https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html=
#release-notes-for-4-0-kirkstone</a><br>
<br>
<br>
That&#39;s *very weird* because the substitution happened in<br>
<a href=3D"https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev/b=
rief-yoctoprojectqs/index.html</a> but<br>
not in<br>
<a href=3D"https://docs.yoctoproject.org/dev/migration-guides/migration-4.0=
.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_blank"=
>https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#rele=
ase-notes-for-4-0-kirkstone</a><br>
(same version).<br>
<br>
When I build the docs locally things look fine. Any ideas what could<br>
cause this?<br></blockquote><div><br></div><div>I can reproduce the issue w=
hen building locally. I am using Sphinx=3D=3D4.4.0</div></div></div></block=
quote><div><br></div><div>oh... It&#39;s because the file release-notes-4.0=
.rst is included with a ..include statement. The variable mapping is done w=
ith a custom Sphinx extension (yocto-vars.py) which is triggered for the &#=
39;source-read&#39; event. So perhaps this event is not triggered when usin=
g an include statement.. let me check more on that..=C2=A0=C2=A0</div></div=
></div></blockquote><div><br></div><div>yes, that seems correct. I don&#39;=
t think we should continue to use the include directive here. Since you try=
 to make one section (for 3.4 and 4.0) with the migration and the release n=
otes, I think something along these lines would work, maybe there is simple=
r..=C2=A0</div><div><br></div><div><br></div><div>diff --git a/documentatio=
n/migration-guides/index.rst b/documentation/migration-guides/index.rst<br>=
index 20c6ab9d4..4597506d0 100644<br>--- a/documentation/migration-guides/i=
ndex.rst<br>+++ b/documentation/migration-guides/index.rst<br>@@ -12,8 +12,=
8 @@ to move to one release of the Yocto Project from the previous one.<br>=
=C2=A0.. toctree::<br>=C2=A0<br>=C2=A0 =C2=A0 migration-general<br>- =C2=A0=
 migration-4.0<br>- =C2=A0 migration-3.4<br>+ =C2=A0 release-4.0<br>+ =C2=
=A0 release-3.4<br>=C2=A0 =C2=A0 migration-3.3<br>=C2=A0 =C2=A0 migration-3=
.2<br>=C2=A0 =C2=A0 migration-3.1<br>diff --git a/documentation/migration-g=
uides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst<=
br>index c22ea814d..d57c955eb 100644<br>--- a/documentation/migration-guide=
s/migration-3.4.rst<br>+++ b/documentation/migration-guides/migration-3.4.r=
st<br>@@ -1,6 +1,3 @@<br>-Release 3.4 (honister)<br>-=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>-<br>=C2=A0Migration notes=
 for 3.4 (honister)<br>=C2=A0----------------------------------<br>=C2=A0<b=
r>@@ -274,6 +271,3 @@ Miscellaneous<br>=C2=A0 =C2=A0examples in :term:`EXTR=
A_USERS_PARAMS`.<br>=C2=A0<br>=C2=A0<br>-.. include:: release-notes-3.4.rst=
<br>-.. include:: release-notes-3.4.1.rst<br>-.. include:: release-notes-3.=
4.2.rst<br>diff --git a/documentation/migration-guides/migration-4.0.rst b/=
documentation/migration-guides/migration-4.0.rst<br>index d737b9d43..a8e6b4=
c33 100644<br>--- a/documentation/migration-guides/migration-4.0.rst<br>+++=
 b/documentation/migration-guides/migration-4.0.rst<br>@@ -265,5 +265,3 @@ =
Miscellaneous changes<br>=C2=A0 =C2=A0when parsing recipes. Any code depend=
ing on the previous behaviour will no longer<br>=C2=A0 =C2=A0work - change =
any such code to explicitly use appropriate path variables instead.<br>=C2=
=A0<br>-<br>-.. include:: release-notes-4.0.rst<br>diff --git a/documentati=
on/migration-guides/release-3.4.rst b/documentation/migration-guides/releas=
e-3.4.rst<br>new file mode 100644<br>index 000000000..81476c4ad<br>--- /dev=
/null<br>+++ b/documentation/migration-guides/release-3.4.rst<br>@@ -0,0 +1=
,10 @@<br>+Release 3.4 (honister)<br>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>+<br>+.. toctree::<br>+<br>+ =C2=A0 migra=
tion-3.4<br>+ =C2=A0 release-notes-3.4<br>+ =C2=A0 release-notes-3.4.1<br>+=
 =C2=A0 release-notes-3.4.2<br>+<br>diff --git a/documentation/migration-gu=
ides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst<br>ne=
w file mode 100644<br>index 000000000..7062f9d24<br>--- /dev/null<br>+++ b/=
documentation/migration-guides/release-4.0.rst<br>@@ -0,0 +1,7 @@<br>+Relea=
se 4.0 (kirkstone)<br>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>+<br>+.. toctree::<br>+<br>+ =C2=A0 migration-4.0<br>=
+ =C2=A0 release-notes-4.0<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2876): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2876" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2876</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90726109/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90726109/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--00000000000006507705dda181cc--


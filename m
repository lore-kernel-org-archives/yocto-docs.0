Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12C0CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 05:33:45 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4877.1780551224506238975
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 22:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IlXQ8Bs+;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137dd523634so463992c88.1
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 22:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780551224; cv=none;
        d=google.com; s=arc-20240605;
        b=iKl2JD5C2X1wD6SmNkKr+Q0JWt63r+cDs0lbCSFVYQFnd9ZqHGMcLaI7LymRCDax53
         TIvCYTyEv6juQZkC27GBTszHvFgXxa1U/nuJOB01SpEG3KVUzWdYG3cHmeNAO6PG3t6r
         ucYHGv2KS1sVuLRRbMfKGYDGalRW8SGhgQlxk0Ijk5LFSEeRx/qL+NseC8+ERqBlY1va
         Uvow2aHX0FiR2/eY+6gCnwquV8L6+MxX8/O4AeRsKGswcYtOFA/weZw6k5NBUF1YzCUw
         hJN5m4tnJSXZrJ6zGYG5R5qkXoJEr247TQqwTnjLXFmWk2U9rerIxtSWWHg1ITswaWFa
         b/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B7vmEAUBlPkO1YULj76rpqRbyLSiwzNKILaI8ycSy/4=;
        fh=IxZgEuQXMB91XIQgfTztCXWR2yB2QcSfnxWqrcaP6HQ=;
        b=cIFtuajYMRC7ABR5+/+J3GLbzC9/Prm2D4jcHDnH24PKadytnLiUM+Y3tSdNSrtimp
         oFsaoxzllSlJpEzpfqyFz4sZyXiNtu2+1ItJPuJGSFl8RPP40/9GbokaYuCf+neaRss/
         /sxZl0auOS/LjyqYT09jEgHHJN0UODt2CC2HTcZBY4KCI/sPSudkzDXcPvg22jlmF4v0
         csFg9vjCaAUYuPUQ7LT0unzul2oxPLgBbEQsOkOiRVcNbLqkzDyOljhb7KEQSjt4nFby
         gT5mg8DreKrh4ACb1Vfn1OpczP97KryELamRi+bEwJ81GiPTCTN28pL98WdLskG42KOA
         d1gA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780551224; x=1781156024; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B7vmEAUBlPkO1YULj76rpqRbyLSiwzNKILaI8ycSy/4=;
        b=IlXQ8Bs+hz9MnTowJ0ZPrTuM4OqqpMv50Hn4UirE1JVjBXqUklcl4GtRjgn3jDqZlb
         ovzqCSHDqW9eXTX2AL67FZekl9eFPVb+N//JaHsfzCpBcJQnVJ/iQVkDDgfXShL9p3T7
         +xTGtm2UDttOossaoNDdBsmf8R3O8kl9usgjznt1Ei9rxPE17P5VIxQG0dObWvdDDLmF
         mlWH+JGS8S7KsOVW4KyIELYve8J/J1zy1mueJI42chvxTSPly7X+KbwjgkEQNDNn0pH+
         ysLPhgyaf49ncBv14Yu2+gq4F1GatP33p8UCHAUM51s7l98UqDuuxjVRUJQp6H3Ypg9e
         2hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551224; x=1781156024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7vmEAUBlPkO1YULj76rpqRbyLSiwzNKILaI8ycSy/4=;
        b=fJTICi9UQFle6TS3qRux5sXpvP+kE6Z/DhFGJsBMXx8jKo/cD2XfJN5qCkS6HmaWb/
         nQrjDLofKqadSbtM2WaNXhSZPUks3mtqkscBK/NbrHIgJh+xqer9/2tVYLCPjc35haLv
         PloeeUBMM1bXvEOj5VCDqyDBJBKzkBAvSPKMOQFjOp/zSaydfyGvK5sekORfL4Rku/q3
         CtG/iwrFO4iwn7qh5MR/OSYymUap2rsVdiIlR5n9oYeiA2qlzUWZaojygfd+iJCbRO7l
         0dy4SroTYVu0ceP5P0lSiZlcCI3+chfiVmWKjFTfc5IFAAzBt/hgoZDPmgZDlAoL9QUE
         gC3A==
X-Gm-Message-State: AOJu0YzdA0fCUOa6sIxjrTbxAdgnIafEIsUBUil3om6OoICa1jrHY4sj
	CqrLhzyadFreFiZd6r26A6L5gQKS612n3x0gQeAu1gROawgEPgFyCPSmUy2C5JrDnp9Irv6cJjC
	XbKNsLuWA7GxrBAK6LS9zWCtv9q+xn2c=
X-Gm-Gg: Acq92OFrI9laQ83UB7HYwDTpzwXgBwgjbBWPprpprrdnctaowlw00G3SRHH3RspekKQ
	WNyNzzx6eCbAnTcV1gTgmhJrqpjnTO7h0tvLs6X/ZCucv0kinqwdZ5B4YNf35BU71h5npKP82cr
	FB2kP+U7ox5upccZfKZWABeK5r2Twc5CGzS/6Bq/87t0zLxKOzOwTh1+gl76m7M4+/xN1zkta46
	Oc6V72gitjy3ZXS65wxN/NF6/LLRKuGGC2XUqLfynYKkS4mUD+dsYLqsgx15ZiB7qOIHXg3zNR1
	h9iIXaLfqj/9aHfnPURvUEywbTR038BBWhcyGf4lzXwK8tVl3VQWQ942ugF+GcoXFnCBF6JN/rv
	VtIdHGg==
X-Received: by 2002:a05:7022:620:b0:12d:de3e:86b9 with SMTP id
 a92af1059eb24-137f6bea72emr3009510c88.41.1780551222524; Wed, 03 Jun 2026
 22:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev> <20260603-sec-team-v2-2-ee7d2016fbf4@pbarker.dev>
In-Reply-To: <20260603-sec-team-v2-2-ee7d2016fbf4@pbarker.dev>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 4 Jun 2026 07:33:29 +0200
X-Gm-Features: AVHnY4KiE2GSpxyIhogqojNVDL9zGbOR-VfzhcO5SgGM3uVk3vemOkwDkgKb8KU
Message-ID: <CAApg2=Sk8FjK4PSHd+FfcDWYdAy0yvB8SqUYfB+ke908PRKniA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/3] security-team: Tidy and update section on
 security team operations
To: Paul Barker <paul@pbarker.dev>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001f7f7c065366e379"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 05:33:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9574

--0000000000001f7f7c065366e379
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026, 21:45 Paul Barker via lists.yoctoproject.org, <paul=
pbarker.dev@lists.yoctoproject.org> wrote:

> The section "What Yocto Security Team does when it receives a security
> vulnerability" duplicated information already found in the previous
> section "Security Team Operations", so merge the sections and tidy up
> the flow of the text.
>
> While we're editing this, Mitre is now just one of the places you can go
> to get a CVE assigned, many other CVE Numbering Authorities (CNAs) are
> available. They also now have a web form for contact and requesting CVE
> assignment so let's link directly to that.
>

Assigning CVEs from different CNAs for the same project has heavy
disadvantages, and it has been an option since the beginning.

I originally wrote only about Mitre, to have all CVEs in the same scope and
make it easier to update if needed (contacting one entity only).

But there are other options. For example, Ygreky is a CNA, so I can assign
from our pool if needed.

And that brings again the question if YP desires to become a CNA.

Kind regards
Marta





> Also drop "If an upstream project does not respond quickly" down a
> heading level.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  documentation/security-reference/security-team.rst | 26
> +++++++---------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
>
> diff --git a/documentation/security-reference/security-team.rst
> b/documentation/security-reference/security-team.rst
> index 7ec1dda02e0c..c83ada17eb56 100644
> --- a/documentation/security-reference/security-team.rst
> +++ b/documentation/security-reference/security-team.rst
> @@ -56,31 +56,21 @@ original reporter in the loop. There is also sometimes
> some coordination for
>  handling patches, backporting patches etc, or just understanding the
> problem
>  or what caused it.
>
> -When the fix is publicly available, the YP security team member or the
> -package maintainer sends patches against the YP code base, following usual
> -procedures, including public code review.
> -
> -What Yocto Security Team does when it receives a security vulnerability
> -=======================================================================
> -
> -The YP Security Team team performs a quick analysis and would usually
> report
> -the flaw to the upstream project. Normally the upstream project analyzes
> the
> -problem. If they deem it a real security problem in their software, they
> -develop and release a fix following their own security policy. They may
> want
> -to include the original reporter in the loop. There is also sometimes some
> -coordination for handling patches, backporting patches etc, or just
> -understanding the problem or what caused it.
> -
>  The security policy of the upstream project might include a notification
> to
>  Linux distributions or other important downstream projects in advance to
>  discuss coordinated disclosure. These mailing lists are normally
> non-public.
>
>  When the upstream project releases a version with the fix, they are
> responsible
> -for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number
> assigned and
> -the CVE record published.
> +for contacting an appropriate CVE Numbering Authority (CNA), such as
> `Mitre
> +<https://cveform.mitre.org/>`__, to get a CVE number assigned and the CVE
> +record published.
> +
> +When the fix is publicly available, the YP security team member or the
> +package maintainer sends patches against the YP code base, following usual
> +procedures, including public code review.
>
>  If an upstream project does not respond quickly
> -===============================================
> +-----------------------------------------------
>
>  If an upstream project does not fix the problem in a reasonable time,
>  the Yocto's Security Team will contact other interested parties (usually
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9572):
> https://lists.yoctoproject.org/g/docs/message/9572
> Mute This Topic: https://lists.yoctoproject.org/mt/119635127/5827677
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> rybczynska@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001f7f7c065366e379
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Jun 2026, 21:45 Paul B=
arker via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org<=
/a>, &lt;paul=3D<a href=3D"mailto:pbarker.dev@lists.yoctoproject.org">pbark=
er.dev@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">The section &quot;What Yocto Security Team does when it receives =
a security<br>
vulnerability&quot; duplicated information already found in the previous<br=
>
section &quot;Security Team Operations&quot;, so merge the sections and tid=
y up<br>
the flow of the text.<br>
<br>
While we&#39;re editing this, Mitre is now just one of the places you can g=
o<br>
to get a CVE assigned, many other CVE Numbering Authorities (CNAs) are<br>
available. They also now have a web form for contact and requesting CVE<br>
assignment so let&#39;s link directly to that.<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Assigning CVEs from different=
 CNAs for the same project has heavy disadvantages, and it has been an opti=
on since the beginning.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
I originally wrote only about Mitre, to have all CVEs in the same scope and=
 make it easier to update if needed (contacting one entity only).</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">But there are other options. For =
example, Ygreky is a CNA, so I can assign from our pool if needed.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">And that brings again the questi=
on if YP desires to become a CNA.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Kind regards</div><div dir=3D"auto">Marta</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote=
_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Also drop &quot;If an upstream project does not respond quickly&quot; down =
a<br>
heading level.<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=
=3D"_blank" rel=3D"noreferrer">paul@pbarker.dev</a>&gt;<br>
---<br>
=C2=A0documentation/security-reference/security-team.rst | 26 +++++++------=
---------<br>
=C2=A01 file changed, 8 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/documentation/security-reference/security-team.rst b/documenta=
tion/security-reference/security-team.rst<br>
index 7ec1dda02e0c..c83ada17eb56 100644<br>
--- a/documentation/security-reference/security-team.rst<br>
+++ b/documentation/security-reference/security-team.rst<br>
@@ -56,31 +56,21 @@ original reporter in the loop. There is also sometimes =
some coordination for<br>
=C2=A0handling patches, backporting patches etc, or just understanding the =
problem<br>
=C2=A0or what caused it.<br>
<br>
-When the fix is publicly available, the YP security team member or the<br>
-package maintainer sends patches against the YP code base, following usual=
<br>
-procedures, including public code review.<br>
-<br>
-What Yocto Security Team does when it receives a security vulnerability<br=
>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-The YP Security Team team performs a quick analysis and would usually repo=
rt<br>
-the flaw to the upstream project. Normally the upstream project analyzes t=
he<br>
-problem. If they deem it a real security problem in their software, they<b=
r>
-develop and release a fix following their own security policy. They may wa=
nt<br>
-to include the original reporter in the loop. There is also sometimes some=
<br>
-coordination for handling patches, backporting patches etc, or just<br>
-understanding the problem or what caused it.<br>
-<br>
=C2=A0The security policy of the upstream project might include a notificat=
ion to<br>
=C2=A0Linux distributions or other important downstream projects in advance=
 to<br>
=C2=A0discuss coordinated disclosure. These mailing lists are normally non-=
public.<br>
<br>
=C2=A0When the upstream project releases a version with the fix, they are r=
esponsible<br>
-for contacting `Mitre &lt;<a href=3D"https://www.cve.org/" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://www.cve.org/</a>&gt;`__ to get a C=
VE number assigned and<br>
-the CVE record published.<br>
+for contacting an appropriate CVE Numbering Authority (CNA), such as `Mitr=
e<br>
+&lt;<a href=3D"https://cveform.mitre.org/" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://cveform.mitre.org/</a>&gt;`__, to get a CVE number=
 assigned and the CVE<br>
+record published.<br>
+<br>
+When the fix is publicly available, the YP security team member or the<br>
+package maintainer sends patches against the YP code base, following usual=
<br>
+procedures, including public code review.<br>
<br>
=C2=A0If an upstream project does not respond quickly<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+-----------------------------------------------<br>
<br>
=C2=A0If an upstream project does not fix the problem in a reasonable time,=
<br>
=C2=A0the Yocto&#39;s Security Team will contact other interested parties (=
usually<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9572): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9572" rel=3D"noreferrer noreferrer" target=3D"_blank">https://list=
s.yoctoproject.org/g/docs/message/9572</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119635127/582=
7677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/119635127/5827677</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank" rel=3D"noreferrer">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
docs/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000001f7f7c065366e379--


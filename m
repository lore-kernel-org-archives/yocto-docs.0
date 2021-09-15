Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.450.1631731071409816376
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 11:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oTgPBVgB;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id g16so2282560uam.7
        for <docs@lists.yoctoproject.org>; Wed, 15 Sep 2021 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llTs/kSO36HyUNAPEZR/2vxwmCtrWaMykSRCDJB8sGc=;
        b=oTgPBVgBonQVYrUFgMAZFvapA8upKf8ABL8IktvVwuyn1nsCJD4ZNQAwBxz1m2NLnz
         4ARRLKAFdaiDXEoDtEpDyotHAgrtB4K7zOvNycJDKBl32bzz4jLpLlF+QuTKqagh6h5m
         BWglk+ARGu3+e1Wd6lnBItcy/Yqn3CGfqv9HfFcgfpe3GvEIEecEzcqDi4de8u18sKg0
         fVHbjGx6e0aQMDjXjFH++yFUOEKPIN0df1xlZLRqkUUmnw70JBvHCSjse8V0INpqtzHm
         dNExzoBrBSNhRxGp4kdy8xZGfUogRzqPJeCO0NW3nXOL1n7BUzqxgTGzTBU+SzSIR1gL
         salg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llTs/kSO36HyUNAPEZR/2vxwmCtrWaMykSRCDJB8sGc=;
        b=e7RN6bGzOuu1d6OKD7Xf/qlA6ooEx2SAYLlyBNWfwDnEUoxgl1uLxvvWsWfVBmkpvR
         HqACVZODShQUsIMZIM3OXA2D79ebijgxjlYUq4Jui5PPZ3cfpxkoOcy3hm2ORQ641m1D
         /b9sfORkpcgjNy640qjjAG1qx+5cCFLFNEKvcdWg6ZfXPzAZwL6mA0DEytoKvaI4R1LN
         u0Bx5PomfTqC8rW/TJTwrj2hEmmpIzHQu6YQuAV3qLEF+M/sg+sMnBD64ODctsZeUmxs
         8BCwdxpAnkj3BR22jPSiIkB8h5Sbydy1YdFv1+4egOWeGtML6p/vFm24UL79wRIFUd1V
         Gq1Q==
X-Gm-Message-State: AOAM532B8C5oEgk3HaseDnlF2dkceJ/5WQGpDYrNSkpX42irrEwU/bNs
	4IyMt+9FfDAe8hSd0Yt9kHZ8BTUyyyblf35HPCk=
X-Google-Smtp-Source: ABdhPJzUr761R0GV0QxlbUGSYSnWaU1uRBKANoTIBRjVMWLAXCAQMIv6REIqybWqppNJRh5YFhshVaXESFEX91y0dvo=
X-Received: by 2002:a05:6130:392:: with SMTP id az18mr1577445uab.71.1631731070549;
 Wed, 15 Sep 2021 11:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org> <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
 <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
In-Reply-To: <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Sep 2021 20:37:39 +0200
Message-ID: <CANNYZj_b4jWAW+MRDhmEMHtL9Cqq7jOONPbRT=zF7fkaZA=fVA@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 3/5] ref-manual: improve "devtool check-upgrade-status" details
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d4431705cc0cfee1"

--000000000000d4431705cc0cfee1
Content-Type: text/plain; charset="UTF-8"

The functionality overlaps somewhat. 'devtool latest-version' takes a
single recipe as an argument, but 'devtool check-upgrade-status' takes a
list of recipes, or nothing (in which case a check for everything runs),
and prints only the items where there is a new upstream version available
in a table format. The former is intended when you want to see a specific
status of something particular, the latter for an overall picture.

Alex

On Wed, 15 Sept 2021 at 19:58, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> - Mention "devtool latest-version recipe" to process a single version
> - Explain that the mechanism is controlled by the UPSTREAM_CHECK*
>   variables, which are not referred to anywhere else in the manuals,
>   except in the variable index.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../ref-manual/devtool-reference.rst          | 29 +++++++++++++------
>  documentation/ref-manual/variables.rst        |  4 +--
>  2 files changed, 22 insertions(+), 11 deletions(-)
>
> diff --git a/documentation/ref-manual/devtool-reference.rst
> b/documentation/ref-manual/devtool-reference.rst
> index 5fd51569a3..2cf9fd43a3 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -328,12 +328,19 @@ Checking on the Upgrade Status of a Recipe
>  Upstream recipes change over time. Consequently, you might find that you
>  need to determine if you can upgrade a recipe to a newer version.
>
> -To check on the upgrade status of a recipe, use the
> -``devtool check-upgrade-status`` command. The command displays a table
> -of your current recipe versions, the latest upstream versions, the email
> -address of the recipe's maintainer, and any additional information such
> -as commit hash strings and reasons you might not be able to upgrade a
> -particular recipe.
> +To check on the upgrade status of a recipe, you can use the
> +``devtool latest-version recipe`` command, which quickly shows the current
> +version and the latest version available upstream. To get such information
> +for all available recipes, use the ``devtool check-upgrade-status``
> command.
> +The command displays a table of your current recipe versions, the latest
> +upstream versions, the email address of the recipe's maintainer, and any
> +additional information such as commit hash strings and reasons you might
> +not be able to upgrade a particular recipe.
> +
> +This upgrade checking mechanism relies on the optional
> :term:`UPSTREAM_CHECK_URI`,
> +:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
> +:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
> +variables which are defined in package recipes.
>
>  .. note::
>
> @@ -342,9 +349,10 @@ particular recipe.
>        file.
>
>     -  If the recipe is using the
> :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:git fetcher
> (\`\`git://\`\`)`
> -      rather than a
> -      tarball, the commit hash points to the commit that matches the
> -      recipe's latest version tag.
> +      rather than a tarball, the commit hash points to the commit that
> matches
> +      the recipe's latest version tag, or in the absence of suitable tags,
> +      to the latest commit (when :term:`UPSTREAM_CHECK_COMMITS` set to
> ``1``
> +      in the recipe).
>
>  As with all ``devtool`` commands, you can get help on the individual
>  command::
> @@ -393,6 +401,9 @@ satisfied.
>     NOTE: busybox 1.29.2 1.30.0 Andrej Valek <andrej.valek@siemens.com>
>     NOTE: dbus-test 1.12.10 1.12.12 Chen Qi <Qi.Chen@windriver.com>
>
> +Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
> +in a recipe when no way is found to determine its latest upstream version.
> +
>  .. _devtool-upgrading-a-recipe:
>
>  Upgrading a Recipe
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 2342846dc7..7545e708c6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8534,9 +8534,9 @@ system and gives an overview of their function and
> contents.
>        You can perform a per-recipe check for what the latest upstream
>        source code version is by calling ``devtool latest-version recipe``.
>        If no combination of the :term:`UPSTREAM_CHECK_URI`,
> :term:`UPSTREAM_CHECK_REGEX`,
> -      `UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS`
> variables in
> +      :term:`UPSTREAM_CHECK_GITTAGREGEX` and
> :term:`UPSTREAM_CHECK_COMMITS` variables in
>        the recipe allows to determine such an latest upstream version,
> -      you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the recipe
> +      you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`` in the recipe
>        to acknowledge that the check cannot be performed.
>        ::
>
> --
> 2.25.1
>
>
> 
>
>

--000000000000d4431705cc0cfee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The functionality overlaps somewhat. &#39;devtool lat=
est-version&#39; takes a single recipe as an argument, but &#39;devtool che=
ck-upgrade-status&#39; takes a list of recipes, or nothing (in which case a=
 check for everything runs), and prints only the items where there is a new=
 upstream version available in a table format. The former is intended when =
you want to see a specific status of something particular, the latter for a=
n overall picture.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 15 Sept 2=
021 at 19:58, Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@b=
ootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">- Mention &quot;devtool latest-ve=
rsion recipe&quot; to process a single version<br>
- Explain that the mechanism is controlled by the UPSTREAM_CHECK*<br>
=C2=A0 variables, which are not referred to anywhere else in the manuals,<b=
r>
=C2=A0 except in the variable index.<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0.../ref-manual/devtool-reference.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 29 +++++++++++++------<br>
=C2=A0documentation/ref-manual/variables.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +--<br>
=C2=A02 files changed, 22 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation=
/ref-manual/devtool-reference.rst<br>
index 5fd51569a3..2cf9fd43a3 100644<br>
--- a/documentation/ref-manual/devtool-reference.rst<br>
+++ b/documentation/ref-manual/devtool-reference.rst<br>
@@ -328,12 +328,19 @@ Checking on the Upgrade Status of a Recipe<br>
=C2=A0Upstream recipes change over time. Consequently, you might find that =
you<br>
=C2=A0need to determine if you can upgrade a recipe to a newer version.<br>
<br>
-To check on the upgrade status of a recipe, use the<br>
-``devtool check-upgrade-status`` command. The command displays a table<br>
-of your current recipe versions, the latest upstream versions, the email<b=
r>
-address of the recipe&#39;s maintainer, and any additional information suc=
h<br>
-as commit hash strings and reasons you might not be able to upgrade a<br>
-particular recipe.<br>
+To check on the upgrade status of a recipe, you can use the<br>
+``devtool latest-version recipe`` command, which quickly shows the current=
<br>
+version and the latest version available upstream. To get such information=
<br>
+for all available recipes, use the ``devtool check-upgrade-status`` comman=
d.<br>
+The command displays a table of your current recipe versions, the latest<b=
r>
+upstream versions, the email address of the recipe&#39;s maintainer, and a=
ny<br>
+additional information such as commit hash strings and reasons you might<b=
r>
+not be able to upgrade a particular recipe.<br>
+<br>
+This upgrade checking mechanism relies on the optional :term:`UPSTREAM_CHE=
CK_URI`,<br>
+:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,<br>
+:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`<br>
+variables which are defined in package recipes.<br>
<br>
=C2=A0.. note::<br>
<br>
@@ -342,9 +349,10 @@ particular recipe.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file.<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 If the recipe is using the :ref:`bitbake:bitbake-user=
-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`<br>
-=C2=A0 =C2=A0 =C2=A0 rather than a<br>
-=C2=A0 =C2=A0 =C2=A0 tarball, the commit hash points to the commit that ma=
tches the<br>
-=C2=A0 =C2=A0 =C2=A0 recipe&#39;s latest version tag.<br>
+=C2=A0 =C2=A0 =C2=A0 rather than a tarball, the commit hash points to the =
commit that matches<br>
+=C2=A0 =C2=A0 =C2=A0 the recipe&#39;s latest version tag, or in the absenc=
e of suitable tags,<br>
+=C2=A0 =C2=A0 =C2=A0 to the latest commit (when :term:`UPSTREAM_CHECK_COMM=
ITS` set to ``1``<br>
+=C2=A0 =C2=A0 =C2=A0 in the recipe).<br>
<br>
=C2=A0As with all ``devtool`` commands, you can get help on the individual<=
br>
=C2=A0command::<br>
@@ -393,6 +401,9 @@ satisfied.<br>
=C2=A0 =C2=A0 NOTE: busybox 1.29.2 1.30.0 Andrej Valek &lt;<a href=3D"mailt=
o:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&=
gt;<br>
=C2=A0 =C2=A0 NOTE: dbus-test 1.12.10 1.12.12 Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
+Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``<=
br>
+in a recipe when no way is found to determine its latest upstream version.=
<br>
+<br>
=C2=A0.. _devtool-upgrading-a-recipe:<br>
<br>
=C2=A0Upgrading a Recipe<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst<br>
index 2342846dc7..7545e708c6 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -8534,9 +8534,9 @@ system and gives an overview of their function and co=
ntents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0You can perform a per-recipe check for what the =
latest upstream<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0source code version is by calling ``devtool late=
st-version recipe``.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0If no combination of the :term:`UPSTREAM_CHECK_U=
RI`, :term:`UPSTREAM_CHECK_REGEX`,<br>
-=C2=A0 =C2=A0 =C2=A0 `UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHEC=
K_COMMITS` variables in<br>
+=C2=A0 =C2=A0 =C2=A0 :term:`UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREA=
M_CHECK_COMMITS` variables in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the recipe allows to determine such an latest up=
stream version,<br>
-=C2=A0 =C2=A0 =C2=A0 you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`=
` in the recipe<br>
+=C2=A0 =C2=A0 =C2=A0 you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``=
 in the recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0to acknowledge that the check cannot be performe=
d.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0::<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d4431705cc0cfee1--

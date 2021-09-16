Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.320.1631810083062737045
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 09:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D1greiCQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id f18so2576212vka.12
        for <docs@lists.yoctoproject.org>; Thu, 16 Sep 2021 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Zx+XBPzRTpko4w+urQ1stRPqsEOvJT5BdL3nRLoGQw=;
        b=D1greiCQvBboq94Zu3EobWLvTkDV9LQYjDsZ6dZq3k+ERZJ4mG7uv+LVhsTMydfqDu
         ZrJ7OnwPf6IzYMTIiXG+xep0DuyTfx2dpsx0UoFizemYcKK9OtpNINZ78Dp6Bv9oykbg
         BNK/EfwoVibU4eRY1sJCJKfbiJUUQPZvG9hPrmwGjzT7fjYIurfSibegfJiPHQs6dldF
         7thbUnkHF/sOvQW56O1VEeEFk9dfogy0QofrozYclDFS4vUL3u8Fu4Z0y8SsVkyo2J7v
         qll3tY7deYnKKjYMObBGnm7j2HXIMZNQdgq2jAtc0565hVphtHhzW+SshOAp3+vgh8wl
         5H7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Zx+XBPzRTpko4w+urQ1stRPqsEOvJT5BdL3nRLoGQw=;
        b=zi56T7nVlIyr3xgk8GmzENgnjzbzvP66FKcr7+nAFT1JrOV1T39ZGLdlyJEkBiyWua
         R8LxXmOAssck1n1B3GaVhpb5lv9G1QGOcvW1uW9Ehf5uL41OMcAN8J1mascY0TJwFqkd
         w/spRJZQ7SO9rb9/ZxYyiF0EJduuPC3EOtUNYmgjhuXoImk0yujlQCgIuVealk7GXwUo
         O3b5BeoLq/NrY7dToJKxyGT47aqiPWodsiRG3I73DLgmCGPQqWyKBDfO4E7Kz2nMmCub
         p+V29IogHlQ2IJhjH7sHnmo0iG0HORw/uXJIj+SnU9Kb4tP/ga78jknk/FPJqI2TtXUC
         rrrA==
X-Gm-Message-State: AOAM533oUtqXs1EuGdBu1QoIp1Gq/C09qJfLXlA/3l0yQ4vxOBxaXgtg
	mM8Ql7jFPwFU4FhOhNiiCZOooiBV303G5iDqg7Q=
X-Google-Smtp-Source: ABdhPJxHcHyRSpvDKgOvTyII7vwnfDYVG6UltiiTJ16jOPqfsu74nHP7+x5GDjWXTP46Y9LS9fH8buKoHFW7hzeX4x4=
X-Received: by 2002:a1f:2c87:: with SMTP id s129mr4309352vks.24.1631810082121;
 Thu, 16 Sep 2021 09:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <16A55A6689FB2BAD.27526@lists.yoctoproject.org> <20210916163129.24479-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210916163129.24479-1-michael.opdenacker@bootlin.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 16 Sep 2021 18:34:31 +0200
Message-ID: <CANNYZj9CP1pa-vLzzO2-jbDPmemmq+ceEy93O=r08L3zPqYsFA@mail.gmail.com>
Subject: Re: [docs] [PATCH v4 3/5] ref-manual: improve "devtool check-upgrade-status" details
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000492beb05cc1f64f4"

--000000000000492beb05cc1f64f4
Content-Type: text/plain; charset="UTF-8"

Thanks, lgtm!

Alex

On Thu, 16 Sept 2021 at 18:31, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> - Mention "devtool latest-version recipe" to process a single version
> - Explain that the mechanism is controlled by the UPSTREAM_CHECK*
>   variables, which are not referred to anywhere else in the manuals,
>   except in the variable index.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../ref-manual/devtool-reference.rst          | 36 ++++++++++++++-----
>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/documentation/ref-manual/devtool-reference.rst
> b/documentation/ref-manual/devtool-reference.rst
> index 5fd51569a3..3e06864f76 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -328,23 +328,37 @@ Checking on the Upgrade Status of a Recipe
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
> +version and the latest version available upstream. To get a more global
> +picture, use the ``devtool check-upgrade-status`` command, which takes a
> +list of recipes as input, or no arguments, in which case it checks all
> +available recipes. This command will only print the recipes for which
> +a new upstream version is available. Each such recipe will have its
> current
> +version and latest upstream version, as well as the email of the
> maintainer
> +and any additional information such as the commit hash or reason for not
> +being able to upgrade it, displayed in a table.
> +
> +This upgrade checking mechanism relies on the optional
> :term:`UPSTREAM_CHECK_URI`,
> +:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
> +:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
> +variables in package recipes.
>
>  .. note::
>
> +   -  Most of the time, the above variables are unnecessary. They are only
> +      required when upstream does something unusual, and default
> +      mechanisms cannot find the new upstream versions.
> +
>     -  For the ``oe-core`` layer, recipe maintainers come from the
>        :yocto_git:`maintainers.inc
> </poky/tree/meta/conf/distro/include/maintainers.inc>`
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
> @@ -393,6 +407,10 @@ satisfied.
>     NOTE: busybox 1.29.2 1.30.0 Andrej Valek <andrej.valek@siemens.com>
>     NOTE: dbus-test 1.12.10 1.12.12 Chen Qi <Qi.Chen@windriver.com>
>
> +Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
> +in a recipe when there's currently no way to determine its latest upstream
> +version.
> +
>  .. _devtool-upgrading-a-recipe:
>
>  Upgrading a Recipe
> --
> 2.25.1
>
>
> 
>
>

--000000000000492beb05cc1f64f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, lgtm!</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, 16 Sept 2021 at 18:31, Michael Opdenacker &lt;<a href=3D"mailto:mic=
hael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Mention &quot;=
devtool latest-version recipe&quot; to process a single version<br>
- Explain that the mechanism is controlled by the UPSTREAM_CHECK*<br>
=C2=A0 variables, which are not referred to anywhere else in the manuals,<b=
r>
=C2=A0 except in the variable index.<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0.../ref-manual/devtool-reference.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 36 ++++++++++++++-----<br>
=C2=A01 file changed, 27 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation=
/ref-manual/devtool-reference.rst<br>
index 5fd51569a3..3e06864f76 100644<br>
--- a/documentation/ref-manual/devtool-reference.rst<br>
+++ b/documentation/ref-manual/devtool-reference.rst<br>
@@ -328,23 +328,37 @@ Checking on the Upgrade Status of a Recipe<br>
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
+version and the latest version available upstream. To get a more global<br=
>
+picture, use the ``devtool check-upgrade-status`` command, which takes a<b=
r>
+list of recipes as input, or no arguments, in which case it checks all<br>
+available recipes. This command will only print the recipes for which<br>
+a new upstream version is available. Each such recipe will have its curren=
t<br>
+version and latest upstream version, as well as the email of the maintaine=
r<br>
+and any additional information such as the commit hash or reason for not<b=
r>
+being able to upgrade it, displayed in a table.<br>
+<br>
+This upgrade checking mechanism relies on the optional :term:`UPSTREAM_CHE=
CK_URI`,<br>
+:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,<br>
+:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`<br>
+variables in package recipes.<br>
<br>
=C2=A0.. note::<br>
<br>
+=C2=A0 =C2=A0-=C2=A0 Most of the time, the above variables are unnecessary=
. They are only<br>
+=C2=A0 =C2=A0 =C2=A0 required when upstream does something unusual, and de=
fault<br>
+=C2=A0 =C2=A0 =C2=A0 mechanisms cannot find the new upstream versions.<br>
+<br>
=C2=A0 =C2=A0 -=C2=A0 For the ``oe-core`` layer, recipe maintainers come fr=
om the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0:yocto_git:`maintainers.inc &lt;/poky/tree/meta/=
conf/distro/include/maintainers.inc&gt;`<br>
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
@@ -393,6 +407,10 @@ satisfied.<br>
=C2=A0 =C2=A0 NOTE: busybox 1.29.2 1.30.0 Andrej Valek &lt;<a href=3D"mailt=
o:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&=
gt;<br>
=C2=A0 =C2=A0 NOTE: dbus-test 1.12.10 1.12.12 Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
+Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``<=
br>
+in a recipe when there&#39;s currently no way to determine its latest upst=
ream<br>
+version.<br>
+<br>
=C2=A0.. _devtool-upgrading-a-recipe:<br>
<br>
=C2=A0Upgrading a Recipe<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000492beb05cc1f64f4--

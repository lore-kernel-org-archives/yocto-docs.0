Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4807BC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 17:21:22 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.2776.1632849681389743669
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 10:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Yi0ZMvs2;
 spf=pass (domain: linaro.org, ip: 209.85.208.45,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f45.google.com with SMTP id bd28so24486086edb.9
        for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=70NFGYFWu0wODvHJf+YvG5VhXVVXOyGdSNL3PezKeUk=;
        b=Yi0ZMvs23ECZ4/wZHS9rfIRWYiS+qLn9BrpC8A77ub0zCF5Q61nnOM8GPVg51rxamW
         HyS5+9pH1eMDtRrhVh/qrziUrE/slg74HDh4/O/qaIspnQOjhzhJ/8bL/BkRYQmH1TER
         lGoNBUWH8s7BBU9K0MEoXnn6Gv+MyzRwcqrFrUaxoiQ9YFhm8dQw2/HPwRMELqTZ/acM
         +7EQgixJMrdaKAzax+ouMaiHLEY0i22B4Z6eNHwz8r3nL6o4Z+AdSDD3hdq5jicEtAgO
         +37Io+p9CuPhDfCJBTDYibuDUB0Afw29/W9ezoQV8U4tjiB78eysew8vV5qBs8MnyDDz
         0bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=70NFGYFWu0wODvHJf+YvG5VhXVVXOyGdSNL3PezKeUk=;
        b=PBrFdEU++mzfWkk4cu86KX2AnNhwkp3hkSHq9PJaMIgnUaNSbL+9fdnZO3jEZU9mf6
         MeRr0bT2Yp/HDh1SaGw+LEQU4WJxRYtEIWHv0tr9VvMe5FgoTFZ0i8DrCvx+FO7U3C01
         r/TVvpTc/UdEkfsnvMyarPezXY+MG/TArB1H15ioZA6Ln2IhTX0WyVwWzdpL/F3aJNqN
         CQD0Qd6fNaAuwBwDvWXrgFLg8M3T4Ek48DVfY9oVOIV2XokgbaUHEeMiIxoTIMIumtNe
         7+vfKmaHkLU9AOW+jBymLfRPcbnOQxV/sglvBzRu/qZEJcykHdxwo88+KvXg4xZe7UR4
         rYMw==
X-Gm-Message-State: AOAM530Y6uW2adnsoUf1TgUs9geyxZBZESzgnbB29VUYNUd74JlKNTs/
	x+p7YFmPOdfzu4UTAaA0GW92VTf9a/yHOigjyugAUw==
X-Google-Smtp-Source: 
 ABdhPJzKSYEmFcEyXcJbuBoLRHBEss7+VcAP6vv44wbaDUEp3MtbUf6br3e+P69gL3D4YIBbfMOICW5A9Xgi0yC62bY=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr8144418ejn.56.1632849679256;
 Tue, 28 Sep 2021 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
 <20210928162202.749990-2-quentin.schulz@theobroma-systems.com>
In-Reply-To: <20210928162202.749990-2-quentin.schulz@theobroma-systems.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 28 Sep 2021 19:21:08 +0200
Message-ID: 
 <CAP71WjzPeZJQsesFc=uweY9=C_QyDOR3UmX5YE4qnWLEVkdWLA@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/4] docs: sphinx-static: switchers.js: correctly
 highlight obsolete releases
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Quentin Schulz <foss@0leil.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 17:21:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1904

hey Quentin!

thanks for getting back to this... we've known this is an issue since
we've migrated.. but never been brave enough to try to fix ;)

On Tue, Sep 28, 2021 at 6:22 PM Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
>
> Currently, only releases before 3.1 are marked as obsolete even though
> 3.2 is already obsolete too.
>
> Since 3.1 is an LTS and is still maintained, it needs to not be marked
> as obsolete, unlike 3.2. Therefore, LTS series are now also tested
> against before marking a release as obsolete.
>
> This makes non-LTS, non-latest releases obsolete.
>
> Cc: Quentin Schulz <foss@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/sphinx-static/switchers.js | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index cb55e35c8..6038ae065 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -10,11 +10,22 @@
>      '2.7.4': 'warrior (2.7.4)',
>    };
>
> +  var latest_release_series = '3.3'
> +  var lts_series = [
> +       '3.1',
> +  ]
> +


in the past I did a few experiments.. What I think would be ideal is
if the 'release' information was actually managed outside of yp-docs,
like it was the case with the previous documentation. It was a task
for the 'release engineer' to maintain that:
http://api-v1.yoctoproject.org/documentation-api
http://api-v1.yoctoproject.org/documentation-api/archived

And the website was loading these files to display the documentation
dynamically.

Since the information is now in git, it's very cumbersome, since
switchers.js exists in each branch.. so fix that we have a big hack in
the deployment script [1], which does:

# Update switchers.js with the copy from master ypdocs
cd $outputdir
find . -name switchers.js -not -path ./_static/switchers.js -exec cp
./_static/switchers.js {} \;

I've faced issues when trying to load an 'external' XML file into the
docs website (something to deal with proxy or permissions..).. so I
tried to have the 'release information' in one structure (in
switchers.js as an intermediate step), which looks like that:

+  var all_versions = [
+    {'version' : 'dev', 'name' : 'dev (3.3)', 'show' : 'yes'},
+
+    {'version' : '3.2',   'show' : 'yes'},
+
+    {'version' : '3.1.3', 'show' : 'yes', 'docbook' : 'yes'},
+    {'version' : '3.1.2', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'outdated'},
+    {'version' : '3.1.1', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'outdated'},
+    {'version' : '3.1',   'show' : 'yes', 'docbook' : 'yes', 'state'
: 'outdated'},
+
+    {'version' : '3.0.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'obsolete'},
+    {'version' : '3.0.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '3.0.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '3.0.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '3.0',   'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+
+    {'version' : '2.7.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'obsolete'},
+    {'version' : '2.7.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '2.7.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '2.7.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '2.7',   'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+  ];

At least, it becomes straightforward to insert a new release in the
table.. I am not sure I ever showed that.. so adding more to the
discussion.. I am sure the project would benefit from an overall
releases information database in a few other places, so that could be
extended.

 [1] http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/scripts/run-docs-build


>    var all_doctypes = {
>        'single': 'Individual Webpages',
>        'mega': "All-in-one 'Mega' Manual",
>    };
>
> +  function ver_obsolete(curr) {
> +    var series = curr.substr(0, 3);
> +    return ver_compare(curr, latest_release_series) < 0 &&
> +           lts_series.indexOf(series) >= 0;
> +  }
> +
>    // Simple version comparision
>    // Return 1 if a > b
>    // Return -1 if a < b
> @@ -219,7 +230,7 @@
>      $('.doctype_switcher_placeholder').html(doctype_select);
>      $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
>
> -    if (ver_compare(release, "3.1") < 0) {
> +    if (ver_obsolete(release) != 0) {
>        $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
>        $('#outdated-warning').css('padding', '.5em');
>      } else if (release != "dev") {
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1900): https://lists.yoctoproject.org/g/docs/message/1900
> Mute This Topic: https://lists.yoctoproject.org/mt/85928522/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>


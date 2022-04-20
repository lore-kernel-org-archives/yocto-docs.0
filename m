Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF54C48BCD
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.6599.1650455067864167185
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SoUsYsZC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id w4so1857774wrg.12
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3AAVdhyAKIBC+WFSkecsknRNtPKKwwN+qq0PjmHoOss=;
        b=SoUsYsZCojI+1PUPDriBLjJqEiGLkYtCnHuFhLzk2e8w7VvHUFlt1Qd8xbaOgMjNV8
         9T5vwJpOvIuIrTetYM98gi9I4vTw1Iljb61UfBdQJCu/ft1phvKWn97dCxQUaBGFNJoI
         U4GYlYpF80DcBroKwyor5+7wuF0/GAxQ31pAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3AAVdhyAKIBC+WFSkecsknRNtPKKwwN+qq0PjmHoOss=;
        b=btOxYlqBaYON3UYuCOFIIWAAH7Y8sl5gewJMBgimKVfoD9/A/VaHFRLciRdUyec2Tx
         LxdLCIXSV0dFpWDQDII7QnvKvVqqkS66VFD+pWPpCQVraQ5mhyEATTaQOIk006iMpqn1
         Ks4O8rfD6CMX0SdaTmMA3JCamGDBy7eU4l9AAthmF/eX+9yHlNC8lhCjW6JUwq7i9x0p
         lZt+m635eXqyCGp5eR9KlhXfHylLEDsFPPOLGChB3J5MMZy7amAxWm/yesPL8i8o1wyr
         OCk2UGb6m0EpsW5mqOPOba283G8Dq9vMXa7iZ34JFUlrmzFe2lRBvsc8rpw5GVB4WUGq
         NF3A==
X-Gm-Message-State: AOAM530E3z3kjqtB0RY+G2qjbiZFru6xRLx7MYKK3ieUTqSCLbLzZzSh
	6UNejmANK6PTnn+/s9hIMIxLZw==
X-Google-Smtp-Source: 
 ABdhPJzxwmgkZWh3jMUM2+zgYWizKOhSJqSHzlIXl44xMnn5712Pk7RLOrozEB/lDivsW37l3OS0qA==
X-Received: by 2002:adf:c64c:0:b0:20a:79c7:4bf2 with SMTP id
 u12-20020adfc64c000000b0020a79c74bf2mr15045063wrg.587.1650455066303;
        Wed, 20 Apr 2022 04:44:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9745:8b8f:81da:af07?
 ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 b3-20020a05600018a300b0020a8b2341f9sm12677287wri.18.2022.04.20.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:44:25 -0700 (PDT)
Message-ID: 
 <1fe08f0546054257ab5849c316eebf25ac918e84.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 3/3] docs: sphinx-static: switchers.js.in: fix
 broken switcher for branches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Quentin Schulz
	 <foss+yocto@0leil.net>
Date: Wed, 20 Apr 2022 12:44:22 +0100
In-Reply-To: <20220420112402.151968-3-foss+yocto@0leil.net>
References: <20220420112402.151968-1-foss+yocto@0leil.net>
	 <20220420112402.151968-3-foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2804

On Wed, 2022-04-20 at 13:24 +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The switcher expects URL subpath to match the "release" used by sphinx
> to build the documentation. Branches, however, are put in a subpath
> after their name (e.g. dunfell) while sphinx sets the "release" to
> X.Y.999. This means the switcher cannot replace correctly the path to
> switch between releases/versions.
> 
> Let set_versions.py inject the list of release names into the
> switchers.js.in file so it can check whether the subpath is one of the
> release names in which case it needs to be stripped.
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/set_versions.py               |  3 +++
>  documentation/sphinx-static/switchers.js.in | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index dfa2dc269..386cff366 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -203,6 +203,9 @@ versions = []
>  with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
>      lines = r.readlines()
>      for line in lines:
> +        if "ALL_VERSIONS_PLACEHOLDER" in line:
> +            w.write(str(list(release_series.keys())))
> +            continue
>          if "VERSIONS_PLACEHOLDER" in line:
>              w.write("    'dev': { 'title': 'dev (%s)', 'obsolete': false,},\n" % release_series[devbranch])
>              for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
> diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
> index a44edbcab..2bc18160d 100644
> --- a/documentation/sphinx-static/switchers.js.in
> +++ b/documentation/sphinx-static/switchers.js.in
> @@ -9,6 +9,10 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
>  (function() {
>    'use strict';
>  
> +  var all_versions =
> +	ALL_VERSIONS_PLACEHOLDER
> +  ;
> +
>    var switcher_versions = {
>      VERSIONS_PLACEHOLDER
>    };
> @@ -157,6 +161,14 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
>          var new_url = docroot + new_versionpath + url.replace(docroot, "");
>          var fallback_url = docroot + new_versionpath;
>      } else {
> +	// check for named releases (e.g. dunfell) in the subpath
> +        $.each(all_versions, function(idx, name) {
> +		if (docroot.endsWith('/' + name + '/')) {
> +			current_version = name;
> +			return false;
> +		}
> +	});
> +
>          var new_url = url.replace('/' + current_version + '/', '/' + new_versionpath);
>          var fallback_url = new_url.replace(url.replace(docroot, ""), "");
>      }

Should this be called "all_releases" or "release_series" instead? It isn't
really a version list?

Cheers,

Richard





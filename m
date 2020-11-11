Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.9263.1605112757922209364
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4CWVmw5rnbz5tlF;
	Wed, 11 Nov 2020 17:39:12 +0100 (CET)
Date: Wed, 11 Nov 2020 17:39:11 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 6/8] dev-manual-common-tasks: Describe how to propose changes to stable branches
Message-ID: <20201111163911.3ahilkvwgyib2zs4@qschulz>
References: <20201111160800.5669-1-pbarker@konsulko.com>
 <20201111160800.5669-6-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201111160800.5669-6-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Wed, Nov 11, 2020 at 04:07:58PM +0000, Paul Barker wrote:
> The documentation on submitting changes to the project should cover the
> ways in which the process differs for stable branches. These changes add
> a brief description of the typical policy for handling changes to stable
> branches and give some steps to follow when proposing changes to these
> branches. The information is based on my personal experience and on the
> existing content of the "How to submit a patch to OpenEmbedded" page on
> the OE wiki.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 0a3ab8241..e923ce834 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -11005,6 +11005,61 @@ Lastly please ensure that you also test your revised changes. In particular
>  please don't just edit the patch file written out by ``git format-patch`` and
>  resend it.
>  
> +Submitting Changes to Stable Release Branches
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The process for proposing changes to a Yocto Project stable branch differs
> +from the steps described above. Changes to a stable branch must address
> +identified bugs or CVEs and should be made carefully in order to avoid the
> +risk of introducing new bugs or breaking backwards compatibility. Typically
> +bug fixes must already be accepted into the master branch before they can be
> +backported to a stable branch unless the bug in question does not affect the
> +master branch or the fix on the master branch is unsuitable for backporting.
> +
> +The list of stable branches along with the status and maintainer for each
> +branch can be obtained from the `Releases wiki page <https://wiki.yoctoproject.org/wiki/Releases>`__.
> +

:yocto_wiki:`Releases wiki page </wiki/Releases>`

> +.. note::
> +
> +   Changes will not typically be accepted for branches which are marked as
> +   End-Of-Life (EOL).
> +
> +With this in mind, the steps to submit a change for a stable branch are as
> +follows:
> +
> +1. *Identify the bug or CVE to be fixed:* This information should be
> +   collected so that it can be included in your submission.
> +
> +2. *Check if the fix is already present in the master branch:* This will
> +   result in the most straightforward path into the stable branch for the
> +   fix.
> +
> +   a. *If the fix is present in the master branch - Submit a backport request
> +      by email:* You should send an email to the relevant stable branch
> +      maintainer and the mailing list with details of the bug or CVE to be
> +      fixed, the commit hash on the master branch that fixes the issue and
> +      the stable branches which you would like this fix to be backported to.
> +
> +   b. *If the fix is not present in the master branch - Submit the fix to the
> +      master branch first:* This will ensure that the fix passes through the
> +      project's usual patch review and test processes before being accepted.
> +      It will also ensure that bugs are not left unresolved in the master
> +      branch itself. Once the fix is accepted in the master branch a backport
> +      request can be submitted as above.
> +
> +   c. *If the fix is unsuitable for the master branch - Submit a patch
> +      directly for the stable branch:* This method should be considered as a
> +      last resort. It is typically necessary when the master branch is using
> +      a newer version of the software which includes an upstream fix for the
> +      issue or when the issue has been fixed on the master branch in a way
> +      that introduces backwards incompatible changes. In this case follow the
> +      steps in :ref:`preparing-changes-for-submissions` and
> +      :ref:`submitting-a-patch` but modify the subject header of your patch
> +      email to include the name of the stable branch which you are
> +      targetting. This can be done using the ``--subject-prefix`` argument to
> +      ``git format-patch``, for example to submit a patch to the dunfell
> +      branch use ``git format-patch --subject-prefix='dunfell][PATCH' ...``.

s/dunfell/&DISTRO_NAME_NO_CAP_MINUS_ONE;/g ?

Thanks,
Quentin

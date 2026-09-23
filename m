Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAD4C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:57:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4373.1790161065520569045
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 03:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dpFEHKzM;
 spf=pass (domain: cherry.de, ip: 40.107.162.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2JF0tB0A4ea/Phbm5JSmd+5nSrP6WP/szNEkGJ2Xtwbiusgh7Gca+KTfwo1+0Bf4zCCJYW7m249vORebmPk69mloiXXlV39D+89SCywCmaiF2m/TSLJ7wuTmS+8NcnV9FEcSc70htrfQZAX66Mcdxmt5Rndgyi7xVkkQR+NNXhtvLcZkv+DEr7QB7W9v2DJyhC+LylNYBHCf/ksEBsmaqfkYMyqPcMAS7WVOVu39NAA2CDwxdH52yTxpYi5rmMchCucmeEphiycYIkAv/CL59nd1PEP1dibUr5JdfzSC0Q8b6hzOQmCK2J09KDXsQivKuI3wE49o43FBiGIVw/SEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EAp/fmFVSb72l3ovSxaj6Alu1yGOx96xSwfuobMT5Y=;
 b=MQdVjmKM7rB0dr5Cy4nMSi2g72Kdme+1ByKf6M4xubupD6gF4ynt9rWYL6m2RLcgDwrle3xhdPqwjoWJY8UVLHhcbq2r5nbrYmdn7hidKptmRS6clFjBRvOEfECLYAUlGbKBe1Tgc5EwMXigBNtYplpJSXiMCfmJMjC6YoQYVtmSXWKYfGts+9AISriFwRPlHOtqyABZIX3U8NZjozcbhVmlQaS8sY7MHH66WV3276benfBUgVocb0MDn+4X7Ci2xVFEoa2h9X6NdyPWBDlLQxe0DyYMt0yng5BakcP0fFknzFMfkLOiDBKDvLhT6bAU8nyjO7p8UqUJhCLRM3I84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EAp/fmFVSb72l3ovSxaj6Alu1yGOx96xSwfuobMT5Y=;
 b=dpFEHKzMJKDUOnskAz0QHtWn57CjKui5jyhV6IQO10M3ganlEtnbG3X08UROvCWq2EI0qV/IL/pJoR0g3O7UA4TFTYE+LHmD9urC3hjhYulaLqZ/m4iNtryHFXMQ/0+hx0Egt9t4fJo38apXAjwLDuCxFRAi/6qRZViG1WjWAQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 10:57:40 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:57:40 +0000
Message-ID: <440060d6-6522-4703-a036-ec42d128f0ad@cherry.de>
Date: Wed, 23 Sep 2026 12:57:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 5/8] docs: mark the placeholders in examples
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-6-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-6-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DB9PR04MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a786cee-02d6-41d6-7d0f-08df19617c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|3023799007|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QDsXqsZYelBJScXi0WCn62DjqSojZA2X5YhZbJ2lgRsvzZRqjh8gcwojwTkjHEnaaYGCeFaeUIhNV9YIE/lvRk85uharohCeMyU7CFFKuajidJYPbMrNq3+BgFONSp5SFclyN8FzRg2kjV7p/JGxAANu37KRpBxK65mb7lxVHgvD8/g6C7WoVMsIvV4o2yejNJCkZYyUkVHtnXC2hSUFQ59zYsj3c8pyLlXEYsmZ8h6P5Rwm9c0C0v5aTlzxo++JJ7LBzvH514OMhPmfHvX1gVsTSY4BGK4K484f589aAXdaqltKCVrs+sbU30ik2/LyhWLyyISwliaOPUK+DDRY6dzVPSyvUzT+oGTUHgC02UOvw1geIFpwLGiTHlGC6xBqt+BpZzeAP9mX7DjZuGLz8A6rJX4HZ9btAv1iFyY5HLZjgKl66cw921sR6Zb3DLBif8xVBTC4iNFYYojUo4WjGSGfl1nUOz83+C6OrEo9fteBOrBHv7BztbkOuhZ2C8F0AY3c4VXL+/jAHTsW8kPqKPS6hUTfv2ZACTh6zzcsD26/cYOUMHDcqocphcxrbup4nPXVkcQlyJGtQC32J3GvPRbzE59NeE8KKoVSDapCmgZbUDxzFMsz3Ipdt8qfJqw9op+N20e0A2t+aZCw2ayw30H6hP0lxKxDTZskocRDiYo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWJYKytqZlZCL0c2VGY5NjRsMW1DZEFoS0lQZDlQY09HSHBFVWZEa1g0T0cz?=
 =?utf-8?B?L1pFZFlEZ2pzZEN3VEVqZ1Ria3pnSlorNHlpWnFSY1JzM1Z6b010VnZaRFE0?=
 =?utf-8?B?M3BaeTJGVUo0bFB1c3RPd1g1RGlkZlBrbVUwc2dlYUtLNTN2WlI3c09ON0hE?=
 =?utf-8?B?REh5UnFueWlJenROMW41UG1iUGdLNmpNc3IxQk5HcFh1b2VLRzUwaW9qemUz?=
 =?utf-8?B?byt0NlQ2dkI0cHNjblYyUkhycTVjMWVwU1B5cFNqT29vRktzYi84ZlNwR01Y?=
 =?utf-8?B?S1FKMWVQYW9QR1E5N2lNYXM5YWp2Vm1LNXhsL2ZBcGtOWFZWYU1QWXhGKzNC?=
 =?utf-8?B?Z3QzVG9XMThoemFVU2pOa2VtVXZNMy9LV1piZWg0SDVzZVFodmdFM1Rjblcy?=
 =?utf-8?B?Mm9sSHRVeFFYcHFFVlJwUWx6WXlUdHJ5c3lXWGN3V2w1NGFicVZid2tWS09X?=
 =?utf-8?B?Qkl1NW9TNmJxS0s0YVMxOWJEVTIwR0hxYXh5NE9VbzVqbXdRNS9SVE9YOFQ1?=
 =?utf-8?B?enhlY2Q4VHA1M08ydEkvZGlHc3FPUzYxUEdjZVVhbnRkZXQ4MEhjY1FXd2U4?=
 =?utf-8?B?OStlc3lYN0o4ZmVZRHB6U1VWbVlHSUUyWWcwdjNyT3FscjJ1TmtXUFZVOHpj?=
 =?utf-8?B?eDFTV0NMWXBYZHQ0NGFWVXh0cUhGUEV1TUQ4VCtOTlNjQ3RSaE9kVEc1QnM0?=
 =?utf-8?B?YUtWVG5XY09NbFd4ZndMMVhQL0pwTldVRnRMMlpDaWpCdi9jdU0yS2lJRkFj?=
 =?utf-8?B?NzMrN2ZjNnMxQzJOWHZyNFNtdVFwVGFQNVZTaUNoVkJ1QXp6NnYyYkIycWgy?=
 =?utf-8?B?K2k0UlJyZ2hkQ0I2NDhueEJxaGI4enVuOUE1VmhCY0gvM0tKTXNHWmZCeVRC?=
 =?utf-8?B?ejIrdGpzTlVLWjdiNEVtVlVhYVB3aVU3U3BMWDN1Ym5UZnJadVB1ME1UNmtw?=
 =?utf-8?B?ZGJTalRMemIydHQ5V1o0T3p5Q0dYM0VYODUrSnQ2S0tsbEFFQ1l1SmJhVFlk?=
 =?utf-8?B?cWpSVFkwMUxody9wQ3owcXU1RlJpdHplc0NkZktwM1VaU1ZDNTh0ZGljeUty?=
 =?utf-8?B?ZHJmQlZ1TkVWMWtPZi9zcGo5OVNqWGNFdktNZytLN1JTZitDNG5WTCttZVpy?=
 =?utf-8?B?a2NMSUZ1RzVxaldoa1g0bDFEYTJRUTd1YU1rSWZkWTJVdElzOTU1QllaSG14?=
 =?utf-8?B?OWtQRnJ6cDZadXBvQzlyR0toRTJVQ1BkQU4xbEEvTi93eWFKeklWTytEcXY3?=
 =?utf-8?B?ZmFKU0NFczBIOVhtOVBTRjRXeEtvT1ZURzlhdWRVZmFmdzJBa2lNRTVmQ0Ew?=
 =?utf-8?B?Q1cxS0xiNDB6SWRuNGYxdTBIOXdFWXoxSnAvZDdtQlFscXZhcEpQcmRDd1hn?=
 =?utf-8?B?QW1weThENVN0cStPKzZOK1laZ2xiMHdBNmdnS2l6SzJ6a2loRUVvM0o5UHQy?=
 =?utf-8?B?Z1F2VFpLUS8weThxTWJSNEpRR1JMNzFha1FEcWptTU02V21PRHlyN1lTREhY?=
 =?utf-8?B?YkFNdDN4clpqZ3BwejI0RGZFcVpweDBOc2xqRHg3UjE5Q2ExRXdZcGlEOXZW?=
 =?utf-8?B?aHVVcWVFS24vVW5yYWJaV3gwUW5zS3dNQ0hNb2hsL0Z3dVpQd3NEbGZwR0NC?=
 =?utf-8?B?NFB1RWU1UVY0TmtZRWhsZk9lb2t5a1NvQnphY05BWDB0dStQQzlVTThUYXpr?=
 =?utf-8?B?N1J2QU56aXBQbFdPUGNoY1hqWWVZQjFqZUViWkVjdjk0eEN1V1pPTU80NWJ2?=
 =?utf-8?B?T2pMR2VZRGFRK3RQbEpZd2dxWllwQnJFTDlCOTFrbFBPQzQ2aXoyMXBYOGFB?=
 =?utf-8?B?ZGsxL3JMNnUyT1N4RHh0SjM0bnBtcHBuUDJIR1NvZm9NVVpkei9lQks5ZjhK?=
 =?utf-8?B?VVhNd3kxbEQ3OE02Y0VoMjZPWUVEY3FJU2dQZUd2WXR6YlNRcWhKdU1LenZE?=
 =?utf-8?B?dUJkQjB3VlZGbEg4c0pFSXV0OW42SVp0WVREY2xEYnIzQ3MrZEVxQjV5S0RK?=
 =?utf-8?B?cWtZcnhjQXpGSWRnbTF2NFdWRkJHeEcvWFhOdnJJdmY1c2hMc1F0dHhkOVk1?=
 =?utf-8?B?NlYxRFNEQmhoYUsrckJ0OHhvZGNQQ1ppc1NjcVRwZTgrSFR3VFNGREVtTUVw?=
 =?utf-8?B?N3BjNmlra0c1Z0FUWE1rMHptbllHSmt4SnJrVzNQYnFybEhyaS9BY1pzK29U?=
 =?utf-8?B?QXVPU3F4U1UydFJpOURrM1lwUlA2VkZRdGsxempZa1dmWTVMODNWd1prR1B4?=
 =?utf-8?B?NlVLTURSMW92eFBrdWFIem56cVhaT1VsQVd0cnhUZUlRY0xzQ1hVTm04QTJp?=
 =?utf-8?B?SHBickt2ZUdxamhzUDFSTHlVbnhaUEZrR0xRRlN0cXl2Z1BkSzdIUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a786cee-02d6-41d6-7d0f-08df19617c9c
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:57:40.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr0x8IbBVER86SsOe7TMm3uYUvNcaLp4xng2f99CX5xy21GFXP4NlyO00XQ0J8ar5hcdL7AQJeBRddnvqdQMii/Bc8G/vsuDECGPs/IVhWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9426
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 10:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10606

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Values the reader is expected to replace are written as though they were
> literal. "arch-gdb" reads like a command that exists, a Git SRC_URI
> example reads like a URL and a pair of revisions worth copying, and the
> git-config examples give an account name and address that are somebody
> else's. Put them in the angle brackets the manuals already use for the
> purpose.
> 
> Two corrections go with them: the directory placeholder in the GDB
> example described itself at length rather than naming the thing, and the
> smtppass example carried a stray "=". Since git config takes a name and
> then a value, that "=" was the value, and the password behind it an
> argument git config reads as a pattern.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - rebased on master-next; no other change
> ---
>   .../contributor-guide/submit-changes.rst         | 12 ++++++------
>   documentation/dev-manual/debugging.rst           |  8 ++++----
>   documentation/migration-guides/migration-5.2.rst | 16 ++++++++--------
>   documentation/ref-manual/devtool-reference.rst   |  2 +-
>   documentation/ref-manual/variables.rst           |  2 +-
>   5 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index e60f8ca7ace3..a283eb734768 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -62,8 +62,8 @@ on Debian and Ubuntu::
>   Then, you need to set a name and e-mail address that Git will
>   use to identify your commits::
>   
> -   $ git config --global user.name "Ada Lovelace"
> -   $ git config --global user.email "ada.lovelace@gmail.com"
> +   $ git config --global user.name "<name>"

<firstname> <lastname>

maybe? I'm guessing some cultures have other orders, I've seen

<lastname>, <firstname>

a few times.

> +   $ git config --global user.email "<email>"
>   
>   By default, Git adds a signature line at the end of patches containing the Git
>   version. We suggest to remove it as it doesn't add useful information.
> @@ -399,8 +399,8 @@ regular STMP server, using a Google Mail account as an example::
>      $ git config --global sendemail.smtpserver smtp.gmail.com

Why is this not changed to a placeholder?

>      $ git config --global sendemail.smtpserverport 587
>      $ git config --global sendemail.smtpencryption tls
> -   $ git config --global sendemail.smtpuser ada.lovelace@gmail.com
> -   $ git config --global sendemail.smtppass = XXXXXXXX
> +   $ git config --global sendemail.smtpuser <email>
> +   $ git config --global sendemail.smtppass <password>

It's also optional, in which case you're prompted every time you send a 
mail, which I kinda like :)

>   
>   These settings will appear in the ``.gitconfig`` file in your home directory.
>   
> @@ -509,7 +509,7 @@ We have a frequent issue with contributors whose patches are received through
>   a ``From`` field which doesn't match the ``Signed-off-by`` information. Here is
>   a typical example for people sending from a domain name with :wikipedia:`DMARC`::
>   
> -   From: "Linus Torvalds via lists.openembedded.org <linus.torvalds=kernel.org@lists.openembedded.org>"
> +   From: "xxx via lists.openembedded.org <xxx@lists.openembedded.org>"

Please keep this one (or use an example that exists in the wild, I don't 
think Linus sent patches to OE-Core :)) as it is an actual example.

>   
>   This ``From`` field is used by ``git am`` to recreate commits with the right
>   author name. The following will ensure that your e-mails have an additional
> @@ -517,7 +517,7 @@ author name. The following will ensure that your e-mails have an additional
>   maintainers accepting your patches don't have to fix commit author information
>   manually::
>   
> -   $ git config --global sendemail.from "linus.torvalds@kernel.org"
> +   $ git config --global sendemail.from "<email>"
>   
>   The ``sendemail.from`` should match your ``user.email`` setting,
>   which appears in the ``Signed-off-by`` line of your commits.
> diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
> index 0f6e9d1d7e85..8412c997a51e 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -810,7 +810,7 @@ be visible. In this case, there is a missing dependency for the ``neard``
>   Makefile target. Here is some abbreviated, sample output with the
>   missing dependency clearly visible at the end::
>   
> -   i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/scott-lenovo/......
> +   i586-poky-linux-gcc  -m32 -march=i586 --sysroot=<path/to/sysroot>
>         .
>         .
>         .
> @@ -1114,11 +1114,11 @@ debugger.
>      After running gdbserver on the target, you need to run Gdb on the
>      host and configure it and connect to the target. Use these commands::
>   
> -      $ cd directory-holding-the-debugfs-directory
> -      $ arch-gdb
> +      $ cd <debugfs-directory>
> +      $ <arch>-gdb
>         (gdb) set sysroot debugfs
>         (gdb) set substitute-path /usr/src/debug debugfs/usr/src/debug
> -      (gdb) target remote IP-of-target:1234
> +      (gdb) target remote <IP-of-target>:1234

Here's yet another prompt we should support that I don't think it's 
supported in patch 2/8.

>   
>      At this
>      point, everything should automatically load (i.e. matching binaries,
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index 77a11fe27047..48f9e7485d93 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -193,9 +193,9 @@ The support for having multiple Git revisions per URL in :term:`SRC_URI` was
>   removed from BitBake, which means the following syntax is not supported
>   anymore::
>   
> -   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX,branchY;name=nameX,nameY"
> -   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
> -   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
> +   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>,<branchY>;name=<nameX>,<nameY>"
> +   SRCREV_<nameX> = "<revisionX>"
> +   SRCREV_<nameY> = "<revisionY>"

We should say that this is the full sha of the commit.

>   
>   This was rarely used in the core repositories because it would only ever make
>   sense for bare clones (the ``bareclone=1`` :term:`SRC_URI` option) where recipes
> @@ -205,10 +205,10 @@ places.
>   If one of your recipes is using this mechanism, you can split the code source
>   fetching into two separate entries::
>   
> -   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX;name=nameX \
> -              git://some.host/somepath;bareclone=1;branch=branchY;name=nameY"
> -   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
> -   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
> +   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>;name=<nameX> \
> +              git://<some.host>/<somepath>;bareclone=1;branch=<branchY>;name=<nameY>"
> +   SRCREV_<nameX> = "<revisionX>"
> +   SRCREV_<nameY> = "<revisionY>"
>   

Ditto.

Cheers,
Quentin


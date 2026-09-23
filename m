Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EE3C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4284.1790160093768319161
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 03:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kkOome93;
 spf=pass (domain: cherry.de, ip: 52.101.84.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVdZs0FjCGUaVBfIVPMbmmF0+orXhvdSeVTYOFc65c89wmAshELGI7lHVZI/rqgoh4HbojR9HCuYU+Rre5NBePTQOBhhN3K9j+31VNGROnm8pARV+BiKRaLe2mTvaiTByeqiO95ynuHSS3p/CrHZLZ3We9/2chwn8rTCq+7nwcZcNmBcKZITCY5+GXAGiIBd26usfBSyWoXhmwr0gW3UJWNWX81rFWp0EnGRR+ohua1gIJdf9M3KoJAp6m7u3TO+jEs4QwC1dNnDgfivFxzo2F7tjHULK2/6uBoeypOZgXHvanDu6XdPVUZ1xCjnEof2pkW6wexpuz58bDe+3wyvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ftFzvHQim5JOTUR9psHEtg44f9sSjQZzO3YO3/0KJw=;
 b=wzO3txVobv1Y4RJBng5PKyAl/IYRriZfe/j7BCC2aTlIwuhlywRIIP0Q3+ht1nHVujtAyo2/6k5dq41jbEh8RaUYO3bcDsl5ag5Kfj5XsirzFANMYYhj+ksnS1llCFAhuTU68UiTTNGMKFirHRPCRcLrmf1h0U1NvPPN8ER+1LeirJVO7ewmRJ4RjhEBGqc4Ubf0AFr+J+5NCFrtd+39sinpb1uebXa11hU/8lfI4nAYQgHoqFAfohjdNEeXRXIfKkDtqwo8P2Psom/c/XCSiH1oRWicv/vD/ljZc/9ersihhLR7u7pBRQ/5a2dEh01/9qkZv7ehIsVN/XtvDB0U7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ftFzvHQim5JOTUR9psHEtg44f9sSjQZzO3YO3/0KJw=;
 b=kkOome93CpC5F6UjiVKJZVOUql2mIUbKt+LZAIrqufzoN81hv1KEzsxQ8UUt/UslIWxwMYEiv/0g0J8x1eLKUH7qRle16k5IOED0KdiMByABcXUWdergTa3zMANfTvuy/hc25Irxf2GH6ApPsq4ZQyl6RGypTE92Ou8jwJna+MU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:41:29 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:41:29 +0000
Message-ID: <ec0f6709-aebc-473a-aa29-121819b6f97d@cherry.de>
Date: Wed, 23 Sep 2026 12:41:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/8] docs: copy only the command from a console
 block
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-3-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-3-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0124.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:350::9) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: bb83535f-aa1c-4d48-9953-08df195f39a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ULGXt0o/+nitb8Zr/+DbxNBnNQLCx3Xadpv8iafKffnCiYkN5gnhf8mcHsGSQ81pXaU3JupMSYeBQsVbOLhc9SwO8tTxqK4Kh7VEOtGZu7Grd/4MwxGaxuzm8PZDHxFS4Nn7aZDrJw/K+WNxb1Fmz/9jFS8OIJbqF2TyurAVJgufm0wVkMVo2OeQ3JchQOgeByhxSjvs+lnF3E04uFMFJIEBNqC/iCdCxOSGHmD4Vsdlfp1lJTt0m/Jiae22Zy/tKwcHyRTm/EJUbrmZv6+Tv02kMrsuH5xCpdyIDXC9ks5XJ2He8BY42sdJqVAO6nCJMNZGuhU5aeR9vGv9er6c2dozdlM2aQGyzRm3UYf5JfgMun7RusiO2CzjEA4nqAKeh3TAxDsNTJUj0Gjn5EHy1W8x6qxYLJtLA/iqsHwDQQRMJLGeFZcs98UYEfgCPjqCw91fqrHC5ssBNw8tHEUTFFjFv9frKAgxXzEgfxCfIptGdgaxKOoX+r5WvET06ArY/NHRufK1OtIklyGaWWSqIvGmdKQP3rddSmdCOl5XBgc1A07N/l4byDQ8vNAS8YiLA2ypmWChOf+sNq9Mn3LvPqWktKT6q52ACXScRi+vSiw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVBxeVRtQ0pVeEc4RGJDekQrWE5vUHZaR2d5SFRYRmRjUlJBRFlSTU9RSjhH?=
 =?utf-8?B?bVMzVmhLUTJuUXR6Q1poZVFSNy9tZjN3b2dsQWdHa1JrejgwcmFjNFgzK1Ax?=
 =?utf-8?B?TlNHU1MrM29BODEySmZVRkVnclRnYTdZbHZHS0pyelMwZXovOTdGTnZzR3BC?=
 =?utf-8?B?d2J2MEFYOXRpSmhTSUEzcnB6TldXbzNmSEJobzloMXFTMFBnbEdHbEozUCti?=
 =?utf-8?B?QmE4U2ZwUE1tdjhub0lCL0RnZVBDMUo4OFVjZWNSU0xhV2RLNDBzQUxzT0NU?=
 =?utf-8?B?Si9ZS0dwcDVCMkJ1YUNMdWJnM2R4SFhwblJkK2VuUFpnUVJUUGhCWk5XTjl2?=
 =?utf-8?B?aG94d0wyVnJnWkFheFM2OW9GVWg0MjNJT1FTdGttSkRvSUh4NldoOE81Vmhv?=
 =?utf-8?B?TFJueFhFQzFiZkhRaGZuR3U2UXQyUmNLWUZPRW1EcWdNVEMxZEdxNG5rOHRU?=
 =?utf-8?B?QzlrYWUvL3kxenluTWhUbllYekU0cnBRL042RnBKRGhuQk1pVUxtbDV3UTRR?=
 =?utf-8?B?M0dLZWdpSFl6Nkp4bXJRdFVIUE9adHdTVW9uRUJHK2t2ZStkUmZrY2RzcTJo?=
 =?utf-8?B?TWpCTGFiR0dyU2c5V0p0VjJwZ0RQZWlqQzFHL0R4NVBkQXA2bmZOdkk1WkFV?=
 =?utf-8?B?RmlWSytwQlBmbUJnbmxKODBldmF4MjVsaGFJbDRVR2pUR0FtVE8rZGVNRGEv?=
 =?utf-8?B?WmlDamZrSHY4aXJ3U3VpL2R4N3Z0ZUNBTmhxNDFMOFBMbUZUNWVJTWhNUFZq?=
 =?utf-8?B?N0JPV3hTMkJKZ0VJU0loN1dVMmEvNlpRTDhwMjYzaUFFMlErNEtWdm9pYWtq?=
 =?utf-8?B?cTUya05xdzJ3VTd5MXpjVlZya01MUVFFdytJUDhjaEptdWdWRmFXcXpYdlZ2?=
 =?utf-8?B?SFVLZk16ZHl1QWFtVmhoRnlHRkVsaHRoWDN1am5raTFWSXRKM3RpdVN0VUZ1?=
 =?utf-8?B?U2R6clpVNDRhY0gwRm1neCtwc0hYZDRTNHdJSXpJdlNibDBTaUV1dkxSb0da?=
 =?utf-8?B?T1FvTDlkZHNvTUdmNWZxOEMrSWVMdVZlUnN3aEhZVU5tQlVFeEtDbEt6SHAv?=
 =?utf-8?B?bU04V0F1SnloNFhhLzRINVU3L0hkdjZqbFZMMUl6aU5LTDBIeXJsWFdSMHNO?=
 =?utf-8?B?VEoyUWxzSXBmVUJKaSs4b2VkU3RXd0FycHlTdXJTQ3RUcjlQUlFjV3JKSklE?=
 =?utf-8?B?Y1NFMEszS3NZSHNvZTlYbDFwTkl1YXlOYWYyNkR1UDVRbjUwLzFZeXFCaUFu?=
 =?utf-8?B?K3dpSDQ3NkRTUlR1dkgydEZ5L1gyWk1PYXFvaHVzZzkxcUMrelowSnhMc2pv?=
 =?utf-8?B?R2NRUUlOMlNaZlFRNUd4SnpFUXRtOWNTU2prbEc3UzQ0cTNtN282ZjFrOEtq?=
 =?utf-8?B?YWd3QW5JRTUyYkw5dE16YkRWd0J4YTdsWi9JTS9hakJaSFl5OUFvbE9zcm9q?=
 =?utf-8?B?azZXY0VET1lWV1R4SW4remlqeXQ3ZXphUzd5YkdkcXhSQnNQSW9mRS9UZGlI?=
 =?utf-8?B?NTFidXdpVzMvQXBuMVZ2QlByd3hLdzFNS1JpRURJcDdtU0l4bDJWQjQ3ajh0?=
 =?utf-8?B?MDFiQ09PNVhMRStqTEFWRytiWXk5VFIwb1NJRlczbUovbU50WE5sWlVYY0Y2?=
 =?utf-8?B?REl4dXBCU04vVzhCdVhiSlJmU2hSNFVFcGNiVndzSkZpQk54NU1Ja05GaFZR?=
 =?utf-8?B?NmhNd3QxZjc1Q3BzYWJ0QlUxb3lOcEFBRWl3d0h4bmRick1iLzg0Z3diZXpR?=
 =?utf-8?B?eXRVTERwbEtWU1czQ2Uza1hTbWU0R3BWVE84WHNjcFVZaVZGZFl5YVY4SXlX?=
 =?utf-8?B?ZUpqWXhSTExIUEdkbFJ2Zy9PQlVnNkxPeGhPOGNwMXFGTC8rbWt6TzJGMXFE?=
 =?utf-8?B?K0l5Y2FvYWFZanFrYjM5b2Rvd0dwcDY2bzhlWEpUT2hFTDdXSDNXdkg5bita?=
 =?utf-8?B?M2VjaWUxSXNucUxHbnQvNkRsWVlQd1BBL1lKdEljMW5uQ1krc3A0bmo1S3hD?=
 =?utf-8?B?R3JPSDFPZ0EzampUSHo4VVhQM0MvTjNYL244dCs0MEZYejhpSXZEU3Q4YWNS?=
 =?utf-8?B?NEZuQTQ5azRwVjIrRHV3R1dPalBrcThnd2R6WWZjbzN2ZHlodmkrMWdKWWUx?=
 =?utf-8?B?dG1KaVM4NklhaW9mcHdxZVVyT0p1blFRUTRWbEp6cVlNNGs5cDMzZm5iNy9G?=
 =?utf-8?B?MUlza0E5ME8rbSttS0dybXlSbkhuRWZueXdoVjRKcnZzazIrRlZBdGI5SFRW?=
 =?utf-8?B?WVRmeW9xQmJMS0M3K3VnVnZ3V2xMOGs0S0tTQ1RINVphbVQ0aEJQakNYc252?=
 =?utf-8?B?dzdHeTBRTkZZTWZjcW5TcWpFMDF3cEEyWUxXTmdCTUxROUFOUVBkQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb83535f-aa1c-4d48-9953-08df195f39a5
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:41:29.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egt6gSXTc30SNHAbqjm6YNk1IOhckcqW/OIfHn3Oz+3lnjrtIZzuQdG+rF2lyvdY+azkVehlcFQZhV2Rep1zamCt7SqSS/hXpXnehbI+iMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 10:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10602

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> The copy button matches the literal "$ " prompt, so on a block prompted
> any other way it matches nothing and falls back to copying every line,
> prompt and output included. Match a pattern covering each prompt shape
> the manuals use instead, so the button gives the command alone whatever
> the prompt looks like.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - dropped the stylesheet change, so a mouse selection keeps the output
> - the comment now says this governs the copy button only, and only
>    reaches a block the console lexer has read
> ---
>   documentation/conf.py | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 48d28a686807..313cabec05bb 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -242,4 +242,30 @@ intersphinx_mapping = {
>   # -- sphinx_copybutton configuration -----------------------------------------
>   
>   # sphinx-copybutton configuration
> -copybutton_prompt_text = "$ "
> +# This governs the copy button only. A mouse selection is a separate
> +# mechanism and takes whatever the theme leaves selectable, which is the
> +# command and its output; Sphinx already excludes the prompt itself.
> +#
> +# It also only reaches a block the console lexer read, since that is what
> +# marks a prompt as a prompt.
> +#
> +# Strip the prompt from a copied line wherever the prompt cannot be
> +# confused with content. The pattern is not scoped to console blocks, so

You say above that it only reaches blocks the console lexer reads and 
now you say it's not scoped to console blocks, this is confusing.

> +# every alternative has to stay safe inside a BitBake or configuration
> +# example as well; measured over the built manuals, each one matches only
> +# lines the lexer itself marks as a prompt.
> +#
> +# A bare "#" is deliberately absent. It opens a root prompt, a comment and
> +# a line of program output alike, and nothing distinguishes them - which is
> +# why the root prompts are given a preamble before this is switched on.

Ask your AI to be less verbose please, or edit the comments by hand.

In 10s I could come up with:

# Only applies to the copybutton. Mouse selection is not impacted.
# <insert whatever is correct for the pattern scope>
# No rule for # as it can denote a comment, root prompt or command output.

> +copybutton_prompt_text = "|".join((
> +    r"^(?:\S+[@:]\S*)?\$\s+",   # "$ ", and "user@host:~$ "

Am I right that (?:) is just to say "do not capture the content" (c.f. 
https://docs.python.org/3/library/re.html#regular-expression-syntax). Is 
it *really* necessary, I find that it adds unnecessary complexity for a 
human to maintain this regexp.

EDIT: sigh... copybutton is parsing with Javascript according to 
https://sphinx-copybutton.readthedocs.io/en/latest/use.html#using-regexp-prompt-identifiers 
but regex101.com says the same (non-capturing group).

> +    r"^\S+[@:]\S*#\s+",         # "root@qemux86-64:~# ", a root prompt

And then you could simply merge the two first regexp into one:

r"^\S+[@:]\S*[#\$]\s+"

> +    r"^[A-Za-z]:\\[^>]*>\s*",   # "C:\WINDOWS\system32>", cmd.exe

Have not used Windows in 15 years so cannot say whether this is 
appropriate. In any case, I'm not sure we'll have more examples than we 
have today for Windows as only the WSL part would use that, so fine with me.

> +    r"^DISKPART>\s*",           # diskpart prints a prompt of its own
> +    r"^pydevshell>\s+",         # bitbake -c pydevshell

question: what happens to the one and only example we have of commands 
to run in a python interpreter? (remove the leading #, it's just so mail 
clients don't interpret this as a quote of a quote of a quote)

# >>> from gi.repository import GLib
# >>> GLib.get_host_name()

> +))
> +copybutton_prompt_is_regexp = True
> +copybutton_only_copy_prompt_lines = True

This is the default, but I'm guessing it doesn't hurt to make it explicit.

> +copybutton_remove_prompts = True

This is the default, but I'm guessing it doesn't hurt to make it explicit.

Cheers,
Quentin


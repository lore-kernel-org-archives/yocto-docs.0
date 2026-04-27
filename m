Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD0EFF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 15:09:08 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47228.1777302542242608115
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 08:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fFjmpWxa;
 spf=pass (domain: cherry.de, ip: 52.101.83.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTDqE+Dv52+b2FMUkaIUtFEn36i6henR4DDf+yENwkRyNlfEH0xQS2YHnORE0MP3H+MFerTSpIqHROqRTEC62DQNld0UrWKSfNtVqtGxOgElSxQsyyFteE0EagC0/n88sM7/V3z2L0GsPB9Gn3C7FLEcE0+W3HnNfjFpQ0dV9dWgpNhNoAnp2AsRx4F99t6pOGPaERTLalcZPgeAkMq63xy5BFgf26g/9TQwr0fSxVoU9N2DuQ/xxl2GK02/D8qVmdZTmkPAUgVNGO1V5fftGp2iNQ1UTRPXxBWvkPtUUUf0B3IX5nEEudBTh/5ajm7MLW3YhpfsWR8UMOHDyWt5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51bLIXrHJRCwgVsgdI2mg4ig37mZhkTI3/fYKrcgRPc=;
 b=gErsEYv/vYb0d232/Wtt5ETsu2W2drr6NqmKCnr4EiN83/AXF5vNPUMfXxE+D+gWEbb7IQvGdIeTkgMi2ozdOcrLYcXbt8GUP2CX5UUvcMWZRd7yjJ8JQpondvPe333ZawPSGTDmyy5FDvPoFw3KxFikFKIirV45n6UfIg0mjwHi3zM43iL8o97sHkzhl14npOVs2QeEXXrO4RgfeZstSNDVg/IMoQ1rI8VYyMK8KhaGXtQk4KZ0RqKOXJzDsg+rO8kySwe8qMgCR3Wgbw2ctHXiGDgbP3cozeFFW6M//H0lg2Jo4/IMwWedc8v4EedN1/oUzEpKcN1fdMkjsl9z0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51bLIXrHJRCwgVsgdI2mg4ig37mZhkTI3/fYKrcgRPc=;
 b=fFjmpWxaRPgJFX79L0bHh6En1GSwNmsd70NRvmGFZCDNsfub5DB2bl3Ib7a7X7GfBYaklJSu59WO6kh32fgY5u+xSzLKyTKm/lXc3tNg6ZJdx/RsqLy/Sz1vNrPSUgqljRHqT4LzPKSK7tiA4x6757Oy9t4+yUYZ5zLnJyWNgFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS8PR04MB9096.eurprd04.prod.outlook.com (2603:10a6:20b:447::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 15:08:56 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 15:08:55 +0000
Message-ID: <1bcdee06-4590-42ae-afb7-1948d21d616f@cherry.de>
Date: Mon, 27 Apr 2026 17:08:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] Document shared state signing
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
 <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
 <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0034.eurprd03.prod.outlook.com
 (2603:10a6:803:118::23) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS8PR04MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: 644da9e8-310b-49db-b095-08dea46ee648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	yfr0w1q1QHKjYK2BiPfq8EFBWzEMNHwT9kKv+dENC6sWTahOUhB26SMUeWezOzFVBnzq3jzjER0yYGk4C9oPmt6ojb3TMaQnTQrfcRtn+As/zRM4ONSW4oXmi3nEINSQsGei9gg+aYU/VsRHXMikJpyZA99ZHXzx1ZqBNBTv55kdKkDoI1qjid8l1pl7MuCyWjSTR3JzjmFgICxoOtayvYvgk5e2EWyMxR4kXyfx7n0+ALIPHFrE72Z9h2D93VXexDT3dtX43TBpO5wbbailZBZpzMupbp0GYN1ZaAKDWp0Ca+xwQklcr6gUEgEiEvWoqk+o3COiGCVmHPHadoA2u+e+NzbFULmd6QNV4L+pVxmmt0cOaby7mI8xFyKZCqlIfU8Nrjx+9ECOLmDnF1R15zMiIIIi9UX2W3QIBA24r5WqZXYJANEaput2cU/X9X5C8KhxkkSr1OmaNbXRPlOwbgsdKBWn8WbjonthXCmZXWgPlyCqJbpMmP3PzSWD1e+LhqJJmSWzkhZmwvsNx6dw3/bIPjpSGiYRyLUYjmNX+052ECWQBYQxoRITirycamMOYlZtF4ZxtRsBFEYaaPvkkwiJF2nMmQekiELD2DV+KAigW5IQveResqoJu2euqHLKtXS7dGa4CpCjSUzrvCkBZ5AXVk1QCZ21IkUYPSD2gstuTL6SU3EXadC2tFyk4bBo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWQwbEwvaURwTnNKbWIyVkhJYkNIODdySVNCVmFCWlZaRUdXTmJQV3k2QWhu?=
 =?utf-8?B?SzFuUU1iNUE5QnJnY1pRN3RJWUNPbFJqL1dwenhqc0NlRUlzckFpVVdIejEy?=
 =?utf-8?B?SlpkSmF3OFp4WjBubU0wMncwcmNzRmpiMmxrYVRtVXhDVWxSU0RQMG1JOEdk?=
 =?utf-8?B?K0JPTlh0MjZoZGNyNWUwVDRtMVZQSXVXVngwV09BbHdzT2U3THAyVXlWVS9V?=
 =?utf-8?B?NmRCMUo4bFNwQllRTVRFWXp2aTNxZTd1ZzlkY2YxN1ZsUnV2N1lYa25TOU80?=
 =?utf-8?B?U3ViUVpUdFEzVGRjZVJXdzFlMlMxRVFzekpyMUV1UlVJSUJDelcvNlEyYld1?=
 =?utf-8?B?STN1ejA5djZLU25vZDd0OGM2YnRHMjBGdncxUEtLUm9zeSsxZkZBRzJQdk1C?=
 =?utf-8?B?SXNXSGZ6TVRqSzFMSHVrMlRRb2FOc2xRRW9YaU1SeHpmNU5ZMGdDZGpNUUtH?=
 =?utf-8?B?a3FiWE1CZEtBZGxINm1PODAzRE9XU0E3aWw2YTQ5U21uS0RxbXYyNDhDaXQ2?=
 =?utf-8?B?QnpGOWxPNm1iUUcvVk5HRjNzaTBGWmpqT1g0aE8rRC9vTTJXWGxrUDIzS0Ir?=
 =?utf-8?B?Z1ZqUHhhWWhvM285dVh6T3hnV3JEbzRKa1h1ZVhsclhLeWlHa1ZCelBHUEx1?=
 =?utf-8?B?dTE3aVNoZitaWTEzRmFscFFIZ21ubkZSMjZIaGhUM2dtN0VuQURuWjI0YUx3?=
 =?utf-8?B?aUdBbDdBWkdiUVBFZlpsanA2YkhzSlRidkNYY3FlMzgyemdQMWFZOTFTWnYz?=
 =?utf-8?B?RnhxN2xZMVoxQlhWZjZ0dmlra0pPVGxnSjRwNjc5bmpHaUlQb3djZGdrd2dF?=
 =?utf-8?B?b2NUTHJiSE1PdlNPTWdJZW9kTEo1Q3NuaXBVb1RicFAvbXpFaDhJcTRoM09K?=
 =?utf-8?B?aW5QdGF2S0FLaHptTkdDamZSZEErekNqMjZvR2h5aW5QdEllUkpNbnEyWWVM?=
 =?utf-8?B?ajVPNkg5WnB4QTVtSS9EYWRUQnpqa0Ntc1BRMGZkRndGdGQ2K1dRdTFwWWRU?=
 =?utf-8?B?UXpWdVVwZm82K081Tm9HT0FWN2Y2eE8wbkhSZnpYdDE5cGtmbk1ydzZ3VnpC?=
 =?utf-8?B?cXV6QW54RmovbytDZ053aW5EbU5jTkFsa3VlcFRMNnE4djBiV2txUTVNL0wv?=
 =?utf-8?B?TWpqa0dEYnI5dEEzRW5ibExGREJVRzNUUml6T2gwRVNsc0Vzd01BVS9zV0NJ?=
 =?utf-8?B?VmpCUE9ici9wKzljV013WjZNZ0dNSHpVTDNOVmhway83L1dhUzZ0Ukp5aDRL?=
 =?utf-8?B?bVdheHFjR3NSZ00rZ2JLaVQ4cm13TE1jUmZkY01uTkh5M1VZdDBLSjhXQ01h?=
 =?utf-8?B?NEM5cU02cXdsSTViUkcwWXFvQTlwOFNoVDl0K2x6dWlScXNLUWlrT2s5MTdD?=
 =?utf-8?B?alBNbzFqK0d2Z08xL015WUFVbU80dGRwbHl1bWk1RU8yaTFYRGZicHpsYnhH?=
 =?utf-8?B?SlRxUUc2aW9XV0Rqa3FwYUNrV3FPMlBqZ0o0bk4wV281TEV2RENzS1JYb3hw?=
 =?utf-8?B?Tzk1UDIyUERraFZtV2VGUHlCalFZRlk1TEx0d3BRVEdqVFJhRUNRSjRVKzhT?=
 =?utf-8?B?SkxMY1I2K2E3NnBXNHR3cG5CU2dQUFV1ZmVxMWt4V0tkRmJGUlR1LzdLMFdM?=
 =?utf-8?B?MDQ5dEl0SS8zU2ZRWFh6cjFBaTE5c2JSVTZwcVF5WTcyTTZDOGY0eldrcFB6?=
 =?utf-8?B?U0xUN3c0OXdRaVB3dUFQUFpEMmpyVjl4U1lHbi9FTVk0K2Jydm5WOVp0alhi?=
 =?utf-8?B?cmk3bHdYVzN6RzdMa0tQbkV2dFZzN0ZVeldmbDFvQW03UnhLMUdnRVRMM2Jz?=
 =?utf-8?B?QmErZEExaFBQcmd6ZHFuVjJOM3ZUNE1GOWpGakxFd1FzS2VnWlJJSWdMQU9n?=
 =?utf-8?B?ZnRRb3JMZkk2Y2hBSXNiSmc5VTJtZ1p3eFJiSEY2NEFLd014a2EyT0Y2cmNY?=
 =?utf-8?B?bXdmMVZCcko5azhhZWlnZndIdTJBbFF2SUYrajVoQUdSendiK0NIUHdkbVU0?=
 =?utf-8?B?UkhubVZqWEpvVzFmY1dKRm5nU2Vac25zS05IMDhLbHFrSVBBQ1UxSXoxSHpo?=
 =?utf-8?B?dW9PUTM2aElVNjZTRHdxUzFRTTlUbXNmZnJHTERqWkQ3dmNielV1a3AvVlhk?=
 =?utf-8?B?NVRidGhrd3lvUjRaRGtEQnhkNktEQXRWeXAyUHBOZWVuWjlOUCtHYzJLU3BQ?=
 =?utf-8?B?VHpCdGM4UUJ4cElKS2FucnFiRk9KdXR3cVN0SEVidmlEZTZBOUZwdWxzMm1h?=
 =?utf-8?B?Kzc5eVdydTgvZ1k0MHRFNVk1ckZ5UW52RzNDVkl0bG9XOHR4VFVIZ25lQThN?=
 =?utf-8?B?SWNiL0s3WlVkQlNUcUhqWlRKbVE2TThXWE81RWR4RUxZNmQwRktyTWszei8z?=
 =?utf-8?Q?XIvdMPvzg2rFVbVMV/EZrsbE4pblb5IS0Hbl3?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 644da9e8-310b-49db-b095-08dea46ee648
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:08:55.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18BuylcUD6VrDXx3mCjNiH8dn0zTdr9TMrd7obIZ+7+gOs4tXnB3PXcl+llNhJ6Uprk2of3qJ8LN44jnH3ho7TBWgZbU8DfebqCkrgIdNtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9096
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 15:09:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9373

Hi Antonin,

On 4/27/26 4:43 PM, Antonin Godard wrote:
> Hi,
> 
> On Fri Apr 24, 2026 at 5:18 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 4/21/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
>>> +   :term:`SSTATE_VALID_SIGS`
>>> +      When verifying :ref:`shared state <overview-manual/concepts:setscene tasks
>>> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
>>> +      "1"), the :term:`SSTATE_VALID_SIGS` variable is a space-separated list of
>>> +      :wikipedia:`GPG <GNU_Privacy_Guard>` key identifiers to use to verify their
>>> +      signature.
>>> +
>>> +      It must contain the short form identifier of the key pair. For example,
>>> +      when running the ``gpg --list-keys`` command:
>>> +

What happens if this variable is empty? My reading of 
meta/lib/oe/gpg_sign.py:LocalSigner:verify() hints at *any* key that 
verifies the signature will do.

>>> +      .. parsed-literal::
>>> +
>>
>> You could use
>>
>> .. code-block:: console
>>
>>      $ gpg --list-keys
>>      pub....
>>
>> to avoid having to use a literal include.
> 
> This use of parsed-literal was intended, as it shows the last 16 characters in
> bold. I'll add " (in bold text below)" before the colon.
> 

We can also use

:emphasize-lines: <line-no>[, <line-no>...]

in code-blocks, see 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-option-code-block-emphasize-lines

[...]

>>> +.. note::
>>> +
>>> +   The `siginfo` file is not related to GPG signing.
>>> +
>>
>> But the first file also not since we haven't enabled signing yet, what
>> did you want to say here?
> 
> Avoid confusion as "siginfo" could make someone think of "signatures" and hence
> signing/gpg. Is adding the note more confusing?
> 

Ah, yes this makes sense to specify this.

What about

Despite its name, the `siginfo` file is unrelated to GPG signing.

?

>>
>>> +Enabling Shared State Signing
>>> +-----------------------------
>>> +
>>> +Create a new :term:`configuration file` on your host **in a safe location** and
>>
>> What makes a location safe?
> 
>> I would suggest to put it somewhere in $HOME/.config/ maybe?
> 
> Maybe, but I don't think that makes it safer?
> 

It puts it outside of a possibly versioned repository, but in itself, 
not better no.

>> Since it contains a secret, we should probably also recommend to do
>>
>> chmod o-rwx <file>
> 
> Yes, I'll add that.
> 
>> no (and possibly chown $USER:$USER <file> ?)
> 
> This should be the default when creating the file but I can add that.
> 

Fair enough.

[...]

>>> +It is advised to put these statements in a separate file as those contain
>>> +secrets and should not be shared. For this example, let's assume this file is
>>> +``conf/sstate-sig-key.conf``.
>>> +
>>> +These statements define:
>>> +
>>> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
>>> +   state signing feature.
>>> +
>>> +-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared state
>>> +   artifacts with the private key.
>>> +
>>> +   In our example, this corresponds to the identifier printed with the ``gpg
>>> +   --list-keys`` command :ref:`above <security-manual/sstate-signing:Generating
>>> +   A Public And Private Key Pair With GPG>`.
>>> +
>>> +-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your private
>>> +   key when creating the key, chosen when creating the key pair.
>>> +
>>
>> Am I the only bothered this is an option? Is there no way to use a
>> keyring or the gpg-agent instead?
> 
> I don't think so, no.
> 

Terrible security practice :(

>>> +Let's test our configuration:
>>> +
>>> +#. Continuing with our ``gettext-minimal-native`` example, let's first clean the
>>> +   existing shared state artifacts:
>>> +
>>> +   .. code-block:: console
>>> +
>>> +      $ bitbake gettext-minimal-native -c cleansstate
>>> +
>>
>> Why do we need to clean the cache (I'm assuming because you want to make
>> sure the artifacts you sign are the one you just generated and not
>> malicious ones, but I think it'd be worth explaining this is not a
>> limitation but a design decision (IFF I really guessed that right)).
> 
> I'm giving an example here, and want to make sure my share state artifacts are
> re-generated.
> 

Then say this :)

[...]

>>> +#. Then, run the task again:
>>> +
>>> +   .. code-block:: console
>>> +
>>> +      $ bitbake gettext-minimal-native -c create_recipe_spdx
>>> +
>>> +#. To make sure the shared state artifact was successfully used, look for the
>>> +   :ref:`setscene <overview-manual/concepts:setscene tasks and shared state>` task
>>> +   for ``create_recipe_spdx`` in the latest log file from :term:`BitBake`:
>>> +
>>> +   .. code-block:: console
>>> +
>>> +      $ grep create_recipe_spdx_setscene tmp/log/cooker/<machine>/console-latest.log
>>> +      NOTE: Running setscene task 1 of 1 (../layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
>>> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
>>> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
>>> +
>>> +   Our shared state was successfully verified and used!
>>
>> Is there any indication in the logs that verification was actually
>> performed?
> 
> No, I didn't find any in the code, or with any verbosity level
> 

Maybe something we should add? This seems like an important piece of 
information to have.

What about

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ede6186c84..fa339644fd 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -132,8 +132,11 @@ class LocalSigner(object):
          status = subprocess.run(cmd, stdout=subprocess.PIPE, 
stderr=subprocess.PIPE)
          # Valid if any key matches if unspecified
          if not valid_sigs:
-            ret = False if status.returncode else True
-            return ret
+            if status.returncode:
+                return False
+
+            bb.note("Signature file %s successfully verified with 
unspecified key" % (sig_file))
+            return True

          import re
          goodsigs = []
@@ -145,6 +148,7 @@ class LocalSigner(object):

          for sig in valid_sigs.split():
              if sig in goodsigs:
+                bb.note("Signature file %s successfully verified with 
key %s" % (sig_file, sig))
                  return True
          if len(goodsigs):
              bb.warn('No accepted signatures found. Good signatures 
found: %s.' % ' '.join(goodsigs))


? I think we may have a few people resisting this as I'm guessing this 
is on the hot path so adding messages isn't the best (even if disabled 
most of the time).

Cheers,
Quentin


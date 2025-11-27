Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558FECFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:47:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22831.1764262068775937563
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 08:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Q17eAogJ;
 spf=pass (domain: cherry.de, ip: 52.101.65.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pgc9W2V/vfDcjTZcU3+7xZvIxmSkg7B6kHOxWCiv+jErbJLo5eZNDP0ZfhMJuEZ3sz27+lPQTmfFUOv4dvI4s9S80IbvJq6WLDTT8oCsc+JSwDG9WISXEdXgD8oaGdc50LBrV5P3zzwBTjUOQT94iqTFNXUtGjM6wIc0BJjamjnUnHlnfGlzLqkwGQKcjK9NvlG53gralMSTPvAiWcWV8Uezp7/0mgPr5x6YgkvNviPwWWGBUi6sRTEWf2ZS5DL5zzYZEGRA0wrYMfojOzrZI3q7lqwvmGF7xIaL6YVvn4yo/mnVzJtA1Ix/73MM7LUsiQmBNqUETKE6Msl2PkOVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+m9MEy2cPOu5zwSAeA+QqS+cMytEoNdnpQHOOddLVM=;
 b=ZqY44NaHfjrogj+9aT5lmBtLIv8TAd58zhL7HTAFqh4xEIl/4cItSYMhLN+bcIRkXtOKXhy/5OcgsgbVAuOFX+Aq4gUwoER59dG7epQt6kuTsv33USwpYoIIMU07IBEoI/lL7Do5fQvUR8xgfsK8W6azsrjnb3eigYTlKlaocm7PfrKLkyCxYu9LlFazfJtIkJIQVt/BgGTYkAxvRz3FQ9BQonobFvL+nqUSMSn9dEmnBk053FMuZlS93+V3p7aTsz4SFQu2ynrcmrrZvYTSMoRtD506aZkcQqeuZyc7ffStpBZSGF9Mb7NnXkmkiwx8mi7rLXFsNHulAhuPqtauaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+m9MEy2cPOu5zwSAeA+QqS+cMytEoNdnpQHOOddLVM=;
 b=Q17eAogJ4LHX5VxEpUE58tstDR2X0aZEhmNT0hHspIg/9dEZVTD3na6HaQv6EsTqNwktLuh1TrY6r+brlFu764gGDxPSBgnDhUCWpwmirgReY3szm9hq+Y+gWHProQe2pmeDOnIMC94tsPihdLjfN4t8aG9j3k9Ji3x8V9lued8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:47:45 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 16:47:44 +0000
Message-ID: <1d128f7c-1af4-4e11-9ce9-b72cecff0485@cherry.de>
Date: Thu, 27 Nov 2025 17:47:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] brief-yoctoprojectqs/index.rst: switch shell
 block to to console lexer
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
 <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5614f0-4c77-41d4-f4fe-08de2dd4b047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NGs1SldCK09KZzZqTi8rbTdFaUpuVStNVTlUaXBoWmppbWR1WllDYytMZDEz?=
 =?utf-8?B?c1RIRE1maGFmMTU3Y2g1OGNaNHpydGJXWnpzOFNnTDN5KzkvMWkzUktETVhF?=
 =?utf-8?B?WlhDSFpVd3p3QzdjeFVpVWpFSWdlNDlGWW8zaVQxY0pQUG5zUlZiYWlLdEhz?=
 =?utf-8?B?SHppYnk1WnExSnM3dy8rMDFXcTdwekRPdCs5TVAvaStzdUxjOGNLRGRTcnpq?=
 =?utf-8?B?Y0luVTZZQm1qaHZxbExpZ1JRMWpwM3B4cHJ2SExvVDhMbUliblpsV3FBWmFs?=
 =?utf-8?B?bnZyWGVla0hhcjByS2ZwNlNnQ1FQK3BpNUYzSWk2VTFCOEhTbWFpbjMwdTJn?=
 =?utf-8?B?TVRwSFgzUCtlTWtmd0ZqTWltRVJraFFBdGN2aVM3bEtNOFJ3cTJJMDZPTkVJ?=
 =?utf-8?B?QnNGVXIvQmRvMm85N3BrWG5qaHZMZGkvQ2JMZnpPZG9KYUpsRnZaWklZbTlC?=
 =?utf-8?B?YTdwMHc0VDhJNm5GTDJhV0RIOGpIbXBJSVJZbENqbG9nKzRQemRMd25rbWV6?=
 =?utf-8?B?blJodmx1TkV2SlpKYWNsdHlNSzNkR2FoaFk4VzdBWFdhY0l2RTVBRW5rcDY2?=
 =?utf-8?B?b015S2VET01ZTDhueVdZTDZqdjV4c01wQXpGbGRLM0luN2ZKSy91b05ZNlN3?=
 =?utf-8?B?dTRhTFgwMUMrUzBlbENSZUluWGpKN1QrKzdSS2tjT3d2Z09xb2FDZVNpcmpj?=
 =?utf-8?B?TTdZUmNndE5HMkxXa3ZZc1FUS1N2TmdPQUJNazRlODBqQTVnMWFBNjVhVCtM?=
 =?utf-8?B?TkwvZW0vcU01QmhWQ1Vud0djWDNrR3BCTzBHMk1BZHMzclg4V1pjbUMvVXdp?=
 =?utf-8?B?ME9POGNESnlkb2lEZkNZVHlnZm9XYzZlamh3U2ZGVmljOE9OU1R2TFlBczRo?=
 =?utf-8?B?STM5OUlRUGdzakVJQXdSNStFSExSVnAvUHQ1bEN6R3g3K2dSbHhJY0dhNk8y?=
 =?utf-8?B?My84Nlg3MDhMZ0kzaXBhRUdoRWFxa2hSTjM0aHVOTndKanFTakJNNHcvblhQ?=
 =?utf-8?B?NTJ0MVdnbURlTWN1NDdSV1FZSjd5RDNEbmNGbFZkM2t4eno1RXlVbkpUcGRo?=
 =?utf-8?B?SDlpc3pacHQwZ1JURGowbnovclZzZHg2ZS9nbURHTjVrSm9CZnJpcnJwdTg5?=
 =?utf-8?B?SEFUVVE5NmZ1UmErRXZsOGZUVzMvZGVRQWtjcVUrOGY1ODkyV2cxdkhpWHBq?=
 =?utf-8?B?WEd0cG1nWFp4eHM3ZTBoYy8vSUdwcXNsbElncEVzTEZXQTF2Rmhkejg2N2Zy?=
 =?utf-8?B?NFlRb0VONEFwcnBhUG5kSURQaFJndDhkZGhUMEFnb2lraVRrejRTT3h0ZWIy?=
 =?utf-8?B?bEtUdXlIQVJjU1FEa05MckZ1c20xcGJMRmNYeGlRRldSMHVRbmNvNEJWUXNz?=
 =?utf-8?B?WWl5WnJ6bUtGT2lEYSszTFBYSVV1U2dXczY0UytSbHpDcWk1WUJyV056c0tP?=
 =?utf-8?B?NEVoN1RzSXE3WEVqRkZWeUQzc0hUVEk5M2JmdHQwZC9NQWRaQ0xKQzdZSS9w?=
 =?utf-8?B?UU5mMHdpMkFJYUdKRENJeVhpSlZiRng4NFdkTXBsSFE3YlVESzJOREJtOHdu?=
 =?utf-8?B?UlZGc09GUityTHo2aXZuN05LYndwcVBKcndQUnpLNjUrczBuV0tIYlZJbmlY?=
 =?utf-8?B?MGx3eGJYUUtwNU13NHpDcXBBaVZoZ3BCZnpsblhibGUwdVY2cUJNNmNBQUta?=
 =?utf-8?B?aElpd0x3SmZ6VjY2S0QxVW9OYW5yVlRhcERVcTZ4dmNYRnExSEpqNnEyUjd1?=
 =?utf-8?B?eUhrcGthcWVjRlpha0M1R210enhqY0t4WVhYUFdnRGVtNXY2cGZ3VmI3Q0xo?=
 =?utf-8?B?SDF6SUYyVE9ISnRacDg0aG0zWllLVnRFUnRpSjVucjB1WnlvQ0phL1hYMFlR?=
 =?utf-8?B?TWlLMTdHQ3VOYW9VL0hCbWVMZXJSYkprQ3JtenpNZlVLaXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YW9zNk9SNEtac3VnQ3NodEd6QzBLanlWVlF6WlRBK3o4QSt6L28xOTVDWEdB?=
 =?utf-8?B?VWR4dVdPa1o3UEFNYWgxZlI2Nkt0eUJEcW4vTE13UnhaUDlSdHdrT0I2WFd4?=
 =?utf-8?B?SFRkVkpYZkk3Vm5NS016VW5Ya2hSY21aR0Z2K2VaZW05OStGNlFycUJiWUI1?=
 =?utf-8?B?cndZUWdaeFFlcFI5djJTbloyY1N1WTRveXpFdXZ2WUpZRzJ3a3Y4ZUJGUFV6?=
 =?utf-8?B?R1QxeG41SHpQdktLMCtVb09nWkFjN0R3ak8vb2xwSU40RG5TTkZ0b0hCTTYr?=
 =?utf-8?B?RnY3TzBvc2d0a2FkVXdZZ1dYOW94cFZFcVhmMWhiQmVmYk5PM3ZsVzJWTTVG?=
 =?utf-8?B?UmFoVEtzRmhOYXhrVVRXVzVmK2tvU2pMSGIwTG8xd1FrcmZaZTA0VUlwYkU1?=
 =?utf-8?B?bFk4NkhyMU5xN3laNWN3WWZCdGhxdkgrOE1JTGNYdUEzVVR3K2lETldDa1I1?=
 =?utf-8?B?S1h5cTJVUkhPZWNTdFdXbWoyMEcwcUtPb3VzMXZObFVjbWduK3lEdlV4UmNo?=
 =?utf-8?B?NVFwSUNvMHZtZXhnRXhRaTNOS2tNdXpmdFBsZUhhNmVMWEV3YldkTUZMQTFT?=
 =?utf-8?B?YnVjZDl5d3NkRkZjS0ZQWktSZEtxOU14cGp2QjlSb3Z4YzZZTGxzeEVyOFZH?=
 =?utf-8?B?eFhoL2ZwNEttcmRFV3R0Y04wQ05QaHVHQm9BUEhkUmJENGIxbVZnaWxzRmNT?=
 =?utf-8?B?ZkR4UzhzalB2YUQ2bklKSjh2MS9xdHErc011ZjBuNktSTHZOMTNxWVBZckFs?=
 =?utf-8?B?bE1GU2Rjb0E2bE1jQkQ1WFI3SzJBTjBHS2tWRVBWRkh1b2c0OHYwV2oxTUt0?=
 =?utf-8?B?bjgyVHQwWmRSYituMVhxSFdQMnRySDdHWE8wMCswa2F3dERWc0ZURmdYMmZJ?=
 =?utf-8?B?dEsyMGRhL1hIeEE2ZS9VL1FocHZZZE1qaUR3bHArWng5QmpEYU1NUFJnSHlO?=
 =?utf-8?B?WFdWUEZlRHJyRDRKSEpSMUxXdlZwZ05yOHZqUDI2Si84VDFxWm5Pbyt6dXFa?=
 =?utf-8?B?eDJCTDRiRTE5L25JbGNFMUlDTEV3ekVNYlpvNW85OWlKa2kvMHU4YUhodTN5?=
 =?utf-8?B?SUpBM0t1M25ialoveDkrN3I3M1ZQeVRWdk9RVFFVTmthN3F6aGM1aklsRFhP?=
 =?utf-8?B?SWZLSmpXSVNGUGhRT1RLWWtSUUs0RjVLOXlvV3lrQTMzUWNRblhMdHhBRmEz?=
 =?utf-8?B?UmNxZXhPWGxra3FrMHRWSGY1WW5TMCtCa1BESWpMOEp4eHZSaTNkM2hYbG50?=
 =?utf-8?B?cDFvUndaSXN2SmczdVMyMnladWlKWU1OQlFDdmEvR2ZabDZXeU84NEdsWWNM?=
 =?utf-8?B?OGZNdGpDaHNPZkpkK2o3eE0vWUYrdXI5cDVnRnpDQnU0QWY0NkVqS2tqRkVt?=
 =?utf-8?B?VWNINE83ZVhYMVNIanpCQ3hMT2ZVRTFBVEJnaXA5NEJxODljVGI2a3BhUlhE?=
 =?utf-8?B?SlhBTDdScldDcnZHQ1haZy95WENyaWN4SExQcFhlclE5OWZxU05oMmJOVFJQ?=
 =?utf-8?B?NkFzd29aN1N6TkowS2sxZVE3ZUlMMHl2THhXZDJ1TjlBOUlYK095REErRkdF?=
 =?utf-8?B?QWxnNWFrNzhrRDJET1FnTm5kVnNYSkdUZnhkVFkyRWxFRU80YURSa0VUTHNr?=
 =?utf-8?B?ZEtGVmVJSVdGRmNLTGJpWE5TalYybFZYeUE2Q2VEMVEyNkNWSWtUZG5CRDFN?=
 =?utf-8?B?aVpNNE9OQXJHVklhWkh5cTNOV1RIS0JyMFR5bGJHYXRET3Mxc0ZubWduR1l0?=
 =?utf-8?B?aUlCdGFNY0hLSW9JQVExb1VuRmMyTzBCa1RHd1FCcEJXeEl6SXJUaDdDS3Fm?=
 =?utf-8?B?NWdDbHBZZUEreU5XODJxM2h2MjBaYnNvTDRRd1lNUzh5UjlJbkJobmdKakdO?=
 =?utf-8?B?VXJSMWw5cXFWNk43cVNQbk5MUFNXOGRYVndhRTc3R3F0T0ZVa1FRdXZHVXhQ?=
 =?utf-8?B?cHJKTllibnNZL251UFZwWUp6NStESU93b1NUV0xrWXI4cXRKQ3Y0SXV0L2Jm?=
 =?utf-8?B?VW9PbkJvNU5UNjNyRithNUFHV2Y0R285R1o3bmJFM0xzOEJ4cXlMQm9rRGJ5?=
 =?utf-8?B?VncyakRoMCtMczR5L0JhblIxWmIzZWJuM250N01VcjR0TGl2NTVxRWlLNW4w?=
 =?utf-8?B?WFNxU2JGdEFOejZoRkJXUFlxb2gycStLUzM4WXRsYkZhZ29oU3Btc0FBejZl?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5614f0-4c77-41d4-f4fe-08de2dd4b047
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:47:44.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKuz4bydNym4ZVYxhxUBii+1hhXv5kQhjh9t4wL//58SY77TwEDbtvBK1/dGBjexWeqyNaDGbFi0llbHKGoFLbb+96S8DNyNf3X6tL1jQg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:47:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8158

Hi Antonin,

On 11/27/25 5:37 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Console outputs are more accurately represented with the 'console'
> lexer. Visually, it separates the command from the output. Switch shell
> block to console blocks.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst | 36 ++++++++++++++--------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 1e0d867d6..b8bd65f4a 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -95,13 +95,13 @@ get a copy of the ``bitbake-setup`` tool to setup the :term:`Poky` reference
>   distribution on your build host. Use the following commands to clone
>   the bitbake repository.
>   
> -.. code-block:: shell
> +.. code-block:: console
>   
>      $ git clone https://git.openembedded.org/bitbake
>   
>   Setup a build environment with the following command:
>   
> -.. code-block:: shell
> +.. code-block:: console
>   
>      $ ./bitbake/bin/bitbake-setup init
>   
> @@ -110,7 +110,7 @@ By default, this will setup a top directory in the current directory.
>   If you prefer to setup your builds in a different top directory, for example
>   ``$HOME/bitbake-builds``, you can set it with the :ref:`bitbake:ref-bbsetup-command-settings` command:
>   
> -.. code-block:: shell
> +.. code-block:: console
>   
>      $ ./bitbake/bin/bitbake-setup settings set --global default top-dir-prefix $HOME
>   
> @@ -125,7 +125,7 @@ differ from the examples below.
>   
>   #. Choose a configuration (for example, ``poky-master``):
>   
> -   .. code-block:: shell
> +   .. code-block:: console
>   

Neither shell nor console. I would suggest to simply use a literal block 
(::), c.f. 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-literal-blocks

>         Available configurations:
>         1. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
> @@ -140,7 +140,7 @@ differ from the examples below.
>      Depending on the choice above, new options can be prompted to further specify
>      which configuration to use. For example:
>   
> -   .. code-block:: shell
> +   .. code-block:: console
>   

Ditto.

>         Available bitbake configurations:
>         1. poky Poky - The Yocto Project testing distribution
> @@ -151,7 +151,7 @@ differ from the examples below.
>   
>   #. Choose a target :term:`MACHINE` (for example, ``qemux86-64``):
>   
> -   .. code-block:: shell
> +   .. code-block:: console
>   

Ditto.

>         Target machines:
>         1. machine/qemux86-64
> @@ -165,7 +165,7 @@ differ from the examples below.
>   
>   #. Choose a :term:`DISTRO` (for example, ``poky``):
>   
> -   .. code-block:: shell
> +   .. code-block:: console
>   

Ditto.

>         Distribution configuration variants:
>         1. distro/poky
> @@ -177,7 +177,7 @@ differ from the examples below.
>   
>   #. Choose a :term:`bitbake:setup` directory name:
>   
> -   .. code-block:: shell
> +   .. code-block:: console
>   

Ditto.

Cheers,
Quentin


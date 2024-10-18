Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC68D2FFF5
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 11:35:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.63])
 by mx.groups.io with SMTP id smtpd.web10.19924.1729251354525929939
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 04:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GuScY9lq;
 spf=pass (domain: cherry.de, ip: 40.107.22.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enBOpvJXM7w0YmmVogUd+/Zej4tMJTdH55Wp0/uC7wPHG3d+Epq9geEqfLZyCSO+64cOFZm7I5rcxsHCTIlZgL+3MorXGa9dzGyTRlwOPngl5RBSAUHB74/EW6TWNC8XkRcllx8aPTZBF3BAt51sEgsZ81H8zvfbcZicWxmiUSADcbEP6eZN1k3pmH3yci2LisuqO0ORGWT6r0V7SN2wevbn3F11Q8JKXqKoEK/Uixa8QGQL/A5XUMWz1SOssWBEOEQJ2VDaSnHfrlHgaaQe1S64khb8vA6JG2Om1VoC0+zQJrN/BUWIkRQYxG3F+JLdju46i/tgaBfrEjIkptupBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll1zKPU0gFmGgyqMWsuFj5+c9ZaGZ9TKqzHH8zzEtsI=;
 b=jmOVB3Dh9BHK9iRQ+4gRSJBP5Et09sHzyIRUdP5e8Fw7RuEOh57qyCkfi7NRSOOjnjj5SNIjL74QnFdae4kG+npFlOk7H4S7Ad+dHxWy+Ikk90CrK3J/hlpFvrpEn7O9nYgb2WW40F1V1JGweNT6yerh5bLQ14wC8E6FOZRmM4WSa/V0tjSmgFuC/+FlJqzxLCFCKZ/I6YSvSoQRMqpYrY8bsE79nTxo1TWlqX7GIwVl6KLzILhxSGN+VrrmQ1joG4wlzcKoXjH/49r3iVpgDxr7B7My2m1CCJLlVf0AsZCoUNmUcSOzjleYS796Sm0H5PmBWB8II8d3XX/Tgx1PjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll1zKPU0gFmGgyqMWsuFj5+c9ZaGZ9TKqzHH8zzEtsI=;
 b=GuScY9lqiBYqLNRJbSvYXn3FxAwqhD/DFFv8Ab85ZOoKmU/+Zib6rtJAwcvgiklbq/E7JkvZTmPfBR9YsVj2IyLhUFtgwlWEk86N4fQTZAO8KxQjDVTuKCG18O5RqIIuy7aX18glpwjPjEDOhIMLVlW5Ue+NDpFdh7pnnXabUJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8871.eurprd04.prod.outlook.com (2603:10a6:10:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 11:35:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 11:35:49 +0000
Message-ID: <24e902a1-e89f-4e23-99f8-6b4792f603f3@cherry.de>
Date: Fri, 18 Oct 2024 13:35:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] ref-manual: devtool-reference: document
 missing commands
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
 <20241017-devtool-improvements-v1-2-2bacc656fe39@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241017-devtool-improvements-v1-2-2bacc656fe39@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0366.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac32661-d0ef-4207-b13f-08dcef6903c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEFxUlhhSXdYQ3plNTBQRFZqRzRTbEg0dnJlYjdVb3Z0VmlRS2MwU2wyTzRv?=
 =?utf-8?B?VmE5Zm8xdmJyZXAyVkVEbnNVNG1ydDZZN3RZR2wyaDRDemhROXl1K0s4SHB5?=
 =?utf-8?B?MXEzVUVLMG5saFYrUWg2djFxRnVSYWNJRnZ3UkRBV1BHSG84NUNrcHN4Mys2?=
 =?utf-8?B?bnVvR0hndVBVTm5VWkVDL2g1ODdEdjF1RFh6TkJXWnc0d2RuRytlMkYrMXJj?=
 =?utf-8?B?VGVJaGJVVVJPL0wyWDNmOEgwRkVNRnU0MHFDcTMrV3hNZXZpUU1BVG94N1dC?=
 =?utf-8?B?ZTFTdHJIK0RkRkh1VWw4cHJoZmpXWWVOandVZzBZS2NVQ3ViWWljVSs4dWl3?=
 =?utf-8?B?TzJMb0RjTWZvZ3J1TUJXSjZSamo2VXJWc3NWTy9Fa1ZEQTR3d29vSUZ0UmM1?=
 =?utf-8?B?M1k1MDErYVkxelFQbFg4ajEzaVhLL2N1QWNMV0lyMzVQSWZzOHhZVGE4d2c5?=
 =?utf-8?B?UkRQUStnYVJTNDcrS2pvdFRlWjhwNGpQanJCVzRuSUwrMGVnR3lBM3RQYVJN?=
 =?utf-8?B?bkJ2Y3ZubnlDL0tsT0gxK3Y0cElEQldOelhqdFl3UXdFV3dwaU84SjBRVytQ?=
 =?utf-8?B?VW9Iamx4Q2g2aU81aERZK0NQMmN3WVNKOFBZWGZvbXIyV0paMW0zclRkRi84?=
 =?utf-8?B?ZWVwK2dzRVljUTk4TWxDc0VPZnIxNEQwcGhpUnI5eFIrdXVVTFNONThoZWgx?=
 =?utf-8?B?L0tNRUsyaEk2Uk5pcVpxekJCSWd4WmNPUjBNRkpxSHFETUdaSi95Y0I4eXR2?=
 =?utf-8?B?aURwNGNDNGRqQmg3TE9CM0FhTzZUeVIwOUZZWnFlOGpnK2MxNHc1eVFidzZs?=
 =?utf-8?B?bS9iWHVHQWRkbi9ETzF6ZHg0T1ZwTTBUOFEzUjF2c2s1WU82UnQwcW8vQnBy?=
 =?utf-8?B?dE42MnptTGpydFdyTWxTZU9VTm5MYzNRY0FlTVhnSC9PeEx0d25idXprWitS?=
 =?utf-8?B?bHhaOXU3MnV4UzFYaGNwQzRyZUpIOGZwQi9INUQyQnY2ZzhNY3hSTDJROWtM?=
 =?utf-8?B?clBNa3ByQzF3NjhYVVkxZ3poTXBDRlBWUFp2eWZJU0tPOEUvbHJqZ1RUY204?=
 =?utf-8?B?ajlRTVU1RkZGM29PVGtnT21BaGtTaXc3aEpZc2RsenUzVnNLRi9ncS8waVgy?=
 =?utf-8?B?Q2FXOTJNT0dBWGdyYzZEcnlON1JxNTFRdUJsL2pBUUlnaG5DQ0l4SWRRajlE?=
 =?utf-8?B?K0ptYS96Y0dtRmJER3RiLzRkWGk3Y055SEJmVEt2Sm85bVBKWVB2T2hsRTZG?=
 =?utf-8?B?ZUFRaU1ZMnNMNkx5YzhkbVhQOXBoNk1rcm5QWWRMNmJmQitIMkFzYUN0YU1Q?=
 =?utf-8?B?UlUrNk1tTVM0WnQ5anB4TndCSnBGcnZEbWNqN0Y4Q0QrMUxYRDZ1cGovaEJB?=
 =?utf-8?B?MlgvUXErRWFtbDFtU0ZWaFFXZVBiRWxYTWpEaXc4SzR1VThIYzJCOVlKdFQy?=
 =?utf-8?B?Tk01Vi8xbHR5aVR4ZFJvTFBON1pZdys2cE40TlByWCttaGozcVhqRjJ6R3ZS?=
 =?utf-8?B?M21ScE1qZFhYakppZTNBV1RYQ2ttcjNtNDhBdXQwLy85cnZENCszOUZZTHZR?=
 =?utf-8?B?ZlNaV3UrQnRXRitqZ2ZRZWp0cUdZRlUyUnViL1JRRnlHbEJpVi9INFhubVBj?=
 =?utf-8?B?UjJkcDNFbk5aZXlQMlpiSWhRR0kzVnZ4Nm5jZU5ISHU2dm5raUJxUEVJT0FT?=
 =?utf-8?B?RndBV3B1b0FzNjFnY2Myei9zdTlJaEtldlh3bzRjQnBsMENxcEtsVE5BQmhC?=
 =?utf-8?Q?G73bcfKQRg0lOdMfjTt441j0xA3aEHVVZBhgX/R?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alhjZHpxRCs2R2lVZ1crMkN1bjd3STl6d2hkUkEzTkQ0eDJQSnNGZGpmdERh?=
 =?utf-8?B?bjltczF6OUlmR05wem5qN1NXZEJHdEtYMjFsNXdTUnNVNloxMVR0Tm5ObUxs?=
 =?utf-8?B?QnA4K0dHYWwxRXVObzVvR0ZaM1gzNEFwSktkdldNV0ZSaW5rVVp2cVJoTWhq?=
 =?utf-8?B?N09qUlZZeUVEZW1rK0Ewc1phbnl0bDFkeGxpSzhSUG1uQVpDYkpKditlVUY2?=
 =?utf-8?B?OStYazFLc1Z6MVZNV29JbWVVc2ZGS2ZHYVBRMUZvUXlFMG45NXJPOHhSaVMv?=
 =?utf-8?B?Q0dQU1Iyd0xOWXFEZmI5ajBiMjdZVVQxWjAwSHVGU21oV2E5L2Ewb1NwYUNN?=
 =?utf-8?B?Mko3WXNTSlNNMkFVQTRqR0FwTFdUUG1pODFuOGNwOFB2WGRmSDQ4RjJGSHdT?=
 =?utf-8?B?LzE4MWJwK0lWOFdEdUpSbHMrakxLNXkwOC83S1ZqY2lCUGxKWVlzMWtuT2E2?=
 =?utf-8?B?QmlzSG03UE5EL3BNUTRITHdqQ1QyaW9yQjhXeTFyRG9JeDVyTks3QXI2cXA4?=
 =?utf-8?B?YWVmL0psZnd4czVEaGFGSGM0Nzg5VlBFQjFyMVJ2YmhjMWFsd2s3enNRV2NQ?=
 =?utf-8?B?YU84c0xJZGM2ZEZ4TmR4czk2LzhZeEZRWUNvZmI1K1o5SEpUbFQzVUQ1WG9q?=
 =?utf-8?B?NTBUek9CbCszVWRSUERldTJib0R0SkdtZnEvak5JU2Nsc0V3ZkRjdkVvYU9I?=
 =?utf-8?B?NkxkVytHWGdGblFpbVM2elk2ZFBLd2w1WCtqc2ptMVBrTEthbnpXc3h1N3Fo?=
 =?utf-8?B?L2NEb2ZERi83YkdzRDlEemNtdE5SRVBBLzVNclJjUXM1VVBlRkV0blp5Z3Iv?=
 =?utf-8?B?Nm1ZZzRkTkNNZnY2RlRSbTFTd0JITzJmNHhJTHRzamRVQXZnaUZXWlZ6TGhr?=
 =?utf-8?B?Uk1WSG9pU3U0NmZxWGEwUHcwMUJmWnBTS25JTWQycHFJVUUvT3JUTUtLZmNl?=
 =?utf-8?B?UWJWdzJUYmNiSDFnU2xCUGJtRUpYaXQzaWorVTkrMUdCeGc1bmVuYVhLQnhx?=
 =?utf-8?B?VkZCc2swNVRqM05GL09rZm40MEhZU050dzFMeWJhK0lRQjJaVzdzS2R4b1px?=
 =?utf-8?B?QmtkK2J3UWFMdWZEenJRVkhSMlJmNyt2S3JoSWU2WHhJaW5jREZuM0VqbVRM?=
 =?utf-8?B?dVlPN1FNdENTOGtnNEZKend0UWQ4OFBHNjJNNDk0ZFp0R0pINTlESHdRNWdX?=
 =?utf-8?B?RUlRYkx2bUVTOWRUUkxNQUQwYjJSdERUWU1KazhyWlVxSDBtbTRaWTNvZkdP?=
 =?utf-8?B?bGhGY0svUlVvNDVKMnZXY1R4WTE2dGJ2TjJQcU5yWWpkdVJJaVZTc2MyNWQx?=
 =?utf-8?B?aGVIaHhTWmJEZnBxY3hmcVdUZUhXbjhhOC9Bai9qd1M5d0RFUlBnb002S0FJ?=
 =?utf-8?B?bzVXRG5NOUpLK3ZNQUdmcDdHVHYzK1JldnFzcXpDcUxUd0VkWlVhemduQzhK?=
 =?utf-8?B?MWt3ZkFNWjJFdkMweHp1TTRXc200UVFuMHB6MDFWYzdwek1FbmZlSGpVYW1w?=
 =?utf-8?B?QVRRZUhRcytINzdpdnFYcHhYTitRdi91MnNSRDNtWW83aUQ4UmptWlZwQXNm?=
 =?utf-8?B?TWQyaElDdmkxbnNCbGwvTEVZL1hDbnE1eHJ1M2xXbFhYa3loYWw1RHpzem1O?=
 =?utf-8?B?ZlhRSWRVRStyaDQ3RVA1cnA2M2ZuekVYTmtDNVloZUc5UVI3MHV5Wkk3MTFV?=
 =?utf-8?B?eXZLZGdGOHlrZUpYbjlzVDJDSlpwQ21BWk4zUDMxY2FlVXFlZzFjT0RsYSs2?=
 =?utf-8?B?c09JeHFNVnZLOThNZTQxU0ZDZk1BZndkdUVLeStFVTAxTExIL2lOdTI3aHFk?=
 =?utf-8?B?Q1FIdlFYM1N5SG1zaXJYU1R5aktmYStQbmhuMHQ4QWtveDVKWityVlVKbkhT?=
 =?utf-8?B?RWR4a0hJZ0tFajdVWVdYeFJqaVZGbFhqdHhhWHZacmhpdXBmaDZJV0g5Z05Z?=
 =?utf-8?B?NUZnTXJnL3Yzelh0Y1EzbzVUd3V6aUFxVVd5enk1ZCswUmppYnF3c0RKa0Uz?=
 =?utf-8?B?T0o5TWdHalBTQkYwaWpOY3hyUWNzN3llblBydmVXN2xwcE9XcFUyU2xEMTFR?=
 =?utf-8?B?MFkxUml6aFdxTFp1VVJhek9pRm5SUVRKMGplOHZwOW42aGVDYWZOYnl5bThl?=
 =?utf-8?Q?pNVB5c6NItiJCYzPfPljv62mA?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac32661-d0ef-4207-b13f-08dcef6903c9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 11:35:49.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S6JbVhPwJ4kzPC02dEnuF01yByB/Foe2KkYPTHdeP2TowEplW44WIa4NgSKBUksS7XFR3UKbPUcdQwh9Qst+ciWzyralfh1HWHwdGvs24Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8871
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 11:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5534

Hi Antonin,

On 10/17/24 5:13 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Give a brief description for important commands that made it into
> devtool or that were missing from this quick reference document.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/devtool-reference.rst | 52 ++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 9c36195c5a5a2405cf8e3a562a2a53291e97c859..e4c7f79a23644f2a89c882ce5e2130fb2a93a4b1 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -463,6 +463,20 @@ Here is an example that resets the workspace directory that contains the
>      NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
>      $
>   
> +.. _devtool-finish-working-on-a-recipe:
> +
> +Finish Working on a Recipe
> +==========================
> +
> +Use the ``devtool finish`` command to push any committed changes to the
> +specified recipe in the specified layer and remove it from your workspace.
> +
> +This is roughly equivalent to the ``devtool update-recipe`` command followed by
> +the ``devtool reset`` command. The changes must have been committed to the git
> +repository created by ``devtool``. Here is an example::
> +
> +  $ devtool finish recipe /path/to/custom/layer
> +
>   .. _devtool-building-your-recipe:
>   
>   Building Your Recipe
> @@ -614,3 +628,41 @@ a match.
>   
>   When you use the ``devtool search`` command, you must supply a keyword.
>   The command uses the keyword when searching for a match.
> +
> +Alternatively, the ``devtool find-recipe`` command can be used to search for
> +recipe files instead of recipe names. Likewise, you must supply a keyword.
> +
> +.. _devtool-get-the-configure-script-help:
> +
> +Get Information on Recipe Configuration Scripts
> +===============================================
> +
> +Use the ``devtool configure-help`` command to get help on the configuration
> +script options for a given recipe. You must supply the recipe name to the

I had to read the code and the help text of the command to understand 
what is meant by "configuration script options".

I guess we could provide an example here to make this a bit clearer?

What about:
"""
E.g. for ``autotools``-based recipes, shows the output of ``./configure 
--help``.
"""

or something along those lines?

> +command.
> +
> +The ``configure-help`` command will also display the configuration options
> +currently in use, including the ones passed through the :term:`EXTRA_OECONF`
> +variable.
> +
> +.. _devtool-generate-an-ide-configuration-for-a-recipe:
> +
> +Generate an IDE Configuration for a Recipe
> +==========================================
> +
> +The ``devtool ide-sdk`` automatically creates an IDE configuration and SDK to
> +work on a given recipe. Depending on the ``--mode`` parameter, different types
> +of SDKs are generated:
> +
> +-  ``modified`` mode: this creates an SDK and generates an IDE configuration in
> +   the workspace directory.
> +
> +-  ``shared`` mode: this creates a cross-compiling toolchain and the
> +   corresponding shared sysroot directories of the supplied recipe(s).
> +
> +The ``--target`` option can be used to specify a ``username@hostname`` string
> +and create a remote debugging configuration for the recipe.
> +

This also means the target needs an SSH server running?

I guess we could put a word on that and maybe say "similarly to 
``devtool deploy-target`` (and we can link to it since it's a reference 
in the same file).

What do you think?

Looks good to me otherwise, though I haven't used any of those options 
aside from finish :)

Cheers,
Quentin


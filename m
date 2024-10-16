Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59418D1AD5C
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:41:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.23534.1729086111614377542
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 06:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DoPB/tii;
 spf=pass (domain: cherry.de, ip: 40.107.20.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKPJREbYQA4aMVSwsEAXct6M3qSxxsuG8PsQEQHD6e5DYiqk/sGY+5rILQphVQPMBzra8lNjxly6TpFsAIkBTU8XteXeXL2eTCBVv8J2GZ0xTh1ZnHTtW3W4RwG7NsvAWu/L0ltzh1tEXa+ENrB7neY6ECR2l5wU68/eDrwqyGkSdAWZpjoQGTwlA28YT9aJWxNK8mJ/b0kNxfVuB0VrFxkspYsK3dTDN5StCGZJiFHGVTCh7zCbx81CDLhYVX9U1lSTv3cn0xjAtrnbBP6Ym2tEWt0c8wchTMkVRNAKIekhmUP3+fwMXNwMP+6QCAWAivxPsK7u03fKM2iK/c1F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22ggUI94aAKpddEYkmGo0H70joenKbxTYqi1W+VBALM=;
 b=ZLBTpLPARn63M5hXarQe6X6J4qcVqF+jLV9ksSFTQuh+qsBPnDsMcGBpwJJLFzaIICWc3cAiN/fzC1D9LbHeFCdB8paFglz781dmBlpHoBwn8t8NEqTcYZ4IozYmy6iOaE7iIGyDtJSb1MSuYCW5M/1wA/6jii8rdDbqkX0tMi1GI+3/o6fsoBhkQxcimft6BoidqUhPScaKGMSg3sMGOZ/mvvu2kuXWPQbCx0Gl1kP5fKbW11JCHUISKatsYVJ96fubJmMxL7s9UWVO8i5GP/+dPZTNKSSSCeyYVZHcZ3uZD9V+ksZVZSTK8+5dkc0rh3bofCCnvgg8Q8uDaunNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22ggUI94aAKpddEYkmGo0H70joenKbxTYqi1W+VBALM=;
 b=DoPB/tiidq9AAAkqVJ87RwFVHUg8yzx4kIrC0ZDXX7ksWhNXg+NswowhMqGxKlYUuvEOlyl7U09gpc8Va2f4qJCKV3kibkagqdMKuwJ6hrZqqJMzJwKAFtYCb1iUvKgTK+nCN9x72Nz32KCbgEKm22/dTlW2j2Xrdv/cydu/Ii8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 13:41:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 13:41:47 +0000
Message-ID: <87a20ffb-583b-4c07-a7e9-455db0672977@cherry.de>
Date: Wed, 16 Oct 2024 15:41:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 1/2] docs: Replace VOLATILE_LOG_DIR with
 FILESYSTEM_PERMS_TABLES
To: Niko Mauno <niko.mauno@vaisala.com>, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
References: <20241016115443.2751525-1-niko.mauno@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016115443.2751525-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9ef279-77e5-47c9-f795-08dcede847ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UjRiL1ltRmwyWllBaXQ5cVdVU05hekZ1ZkJteVcra0FCbkt5cmFmNzVqSXEw?=
 =?utf-8?B?RlBiRzF1bHJDQTNLR2dpT3dGVndyek1Tb0J5a3NLN0VKU0VXa2lsRlZQVjNr?=
 =?utf-8?B?eXJQTWszZjZiaU5NczRpSVBWV2FEVitsS2xLL1FmdzIyM2N5UDlWS2N2VmRG?=
 =?utf-8?B?OCtPVEwvcmFDOTFVaHFrby95QUdxaUZ1S3FUOFRlMUlUaGVIejhiQ2s4RThJ?=
 =?utf-8?B?V3R0dWZCUkFpNTM3WWFtMnA0UU55eDl6UVF5UForZnA1VXF0cmFVUUw1NXFR?=
 =?utf-8?B?WjBibUJQR1pGREhDOGZ3alJUTzVPL2kzUVJ4RnF0TCtDUFBlVjRrZkJjYytY?=
 =?utf-8?B?M3F4NkVVWFozL1J6TzBZYlRpbUNNd3U4dkFTbi83UThwUWh1bUNYUlBLcDU0?=
 =?utf-8?B?YldTbUNIcUdseHAyeTdTaTVteVlnVTdtSExwQXUzZjhYcnIzbC9RVEF2Witx?=
 =?utf-8?B?cHcxZzd0Y3oxeitFY2tsSXFOd3J0MzBpS3UraXZQQm5YeDkzTWdub2dHL2ZF?=
 =?utf-8?B?cC9KSG9KRVRaUGg0eEg1ZE5uUmtmTU1MODFpd3FWMWZ3TEFmd1NxUHR0YndQ?=
 =?utf-8?B?NCt4UkFZZEtjNXo1OXVSZklwMjJraml1VERpYzhieDlPOHpkaEx3cG94bjh2?=
 =?utf-8?B?cml6RHRwcVQyRUhtOUxsTzFDVTM0endKL2lSZHZzWDcxRlhDOFZzWnN4cmtS?=
 =?utf-8?B?eFlpNzc1VEdPTC90Z0ZJMlI0dW5rM3JpNnhKckNQemY3a0hpZ1l5Yy8vK0NO?=
 =?utf-8?B?QVNWOXJwN1VQOFVzRFlDQUhjVFpxL3g0TFVTcmREL1Q4RG5IL1piZW1sdmJO?=
 =?utf-8?B?NHlIOHVmV1gzaU1IV2FMSWx5WlhSN2l6TThzeFhSQjlrN2NmZ2IyYzh3YVVi?=
 =?utf-8?B?dXdlVjVrc2pKOFNvOHR5S3NONEhpa1FiWEJLUnJuNXBzMG9aVzlvOEtIS0lt?=
 =?utf-8?B?UHR6M3Q1NVdUaEFPc0lyQ3BJcnkzSXIxbVFNTGJNSDI3bWJWNnE0eUdiQmdR?=
 =?utf-8?B?N2Q0WVl4ZTFYSEgwc2lPbXdKSkdxKzkzd1J3KzBnWTBrZVZzY3g1akt1VEYv?=
 =?utf-8?B?R0NxZnRSU0svVzRTNHlOSlJJZlRRRFYvRHNKaDYxSlVHWjNUUXkwUEpab2Yz?=
 =?utf-8?B?T2Vyb1NlSWxkdWhFR3g4T1l1VzJNdGdjWmozS0RVZjJCWDU4SHh4ODdhWVZj?=
 =?utf-8?B?SDBMK3Y3WHpnSElzckdmM1NidXVWVmx0cmo2ODF5VGcyTWlBNUk4T1BXZVI3?=
 =?utf-8?B?OTFRTk9EMnZmdk9DbzlxSEJSM3dHVjJBRlFFUU0zZm4rWkh3OEFOMjZWUFFY?=
 =?utf-8?B?WmdhYnBmczh0ZHUzRDEvdU0vLzdUVzdPRHl2OVc5VnNPNEZhWmxhT3Y0N2Jo?=
 =?utf-8?B?RjNyWHpwN0xNUmNVYlljU0dsbG9uYzVmVmNETDhQMlpPakw5b1ZsV2JHNVdV?=
 =?utf-8?B?bU14S05pdThUVVFJb0lEa0c3YXNWajF2ZW9KbnY0MWVLd2RyUTFVVzlmME5t?=
 =?utf-8?B?UVdXajcxOVhZWFV4S3lIS245UTB1ZjgyVGtxdk1HQUUxNHFlL3VHdlRHNjIw?=
 =?utf-8?B?KzRxQmI0QU5LQXJBTElPM241MGpKaWIxa3R0dUhOS0FPaUY5Qk1PWVpSVEEr?=
 =?utf-8?Q?oTgVB+gAwAO9zyfR1fNkDqp8hKqp98gMOTGVV/IUAHyQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M04xWHBZME5SV0pBK0l1OXNQOWdPN2xlaStna1Zkd0RveEhlci9KWEFuVmJY?=
 =?utf-8?B?eTBpcHZ5dWtZODNhL1NmK1JGTG9GZ0RGN1JVbmQvUy82bmpiV2RHU2EyOGl6?=
 =?utf-8?B?NDVIRklSM1FtZGQrdTJRTitlT2JqYllyTlBTNE1PdXl3ZTdYRXlQaXVZMW1u?=
 =?utf-8?B?Q0hWOGlxSFpOMVFSSTFaVXhuTlViODllTnMwOTE4OUV6bml2eWdhQ1QzaWNE?=
 =?utf-8?B?OERkSzNmaHhSUVJSY1Y4U3B2VjIxNHo3eis5eWJvOGIxTGRHNUdrV0pMcGdR?=
 =?utf-8?B?c0dhT3Y3dVhLcm1VMDkzVXJnbnhVMU1wWEJocktBTWxHR2szQ1RGS29Edm53?=
 =?utf-8?B?UHBlbENjNXBQbFBVQkQ1V0NyZkU4Y1NiOFJFdGY0M3RiWml1ZElxR0tZKzhP?=
 =?utf-8?B?S29YLytwT2JPczdlSHgwTmZmQ0ZRWUpIQ3JiNDZ1ZDRCcHR5dEZicnNPVldr?=
 =?utf-8?B?MmtVQU5lZWwxQ1RNMUJTdUFLL0lNYUJTVFN4aFYwUTJNd01lcjlSd2dKMHRR?=
 =?utf-8?B?eVBxekJ4ekNqaVJPdEthWHNzRXlwL1ZqL0NPc0JNcXZJRTV4eVNueGpnb3Nm?=
 =?utf-8?B?WHlFV0VVOGFGclFpRlZnNjBENzNjNXVzWXJiMnFUM3p1dDZ6MENFOCtiMmpV?=
 =?utf-8?B?c2dhTk1uY1EreEdTcERKMEJmTTdNMGYxVWhXdUlXSUJQN2pIUnZScm1za0pB?=
 =?utf-8?B?VExScjdIbmtyNkU4K1dXOXRNUGVUN2RvNklMYTEvY1Zncm1ZOHFLTnBxUy9G?=
 =?utf-8?B?bk4zSXQ5SmpuaHJlZGVGNmFaSVJFRGtnMHhrNFVRbnd2OXBPdXlvcnhPb1Rt?=
 =?utf-8?B?SkZDTEVGUi9VcjZ6M2kxUGdnaWR1TXRkaFEzTjJ0MFJDRFdoSEMzdXU0a05C?=
 =?utf-8?B?Q01ZRW5FVU9iZWQrVDVmVGxtVkRMTU8xVzVsQlNleCtET3cyd05mVGRZTlZJ?=
 =?utf-8?B?TnFneWlGWlVOWmZVRGZMUzRHb0YrTVVXaXIzb1ppeW1GdExDSE9EUEJIWnVz?=
 =?utf-8?B?U2lWYVNYeXI0a1Rpb2NTalVYaFhqNlRSaWtGekpIaWlmbFZGZmdkV3lyYzc2?=
 =?utf-8?B?Nlc2QTlVcXhORVprOGh5V0lGRVNudjcyU09ZNVhqaXZkUHB1bUc4dzNldTRL?=
 =?utf-8?B?NlQzbWZJd21UMGNOOW96YnRCWWtTTmtIVEhkaDdzUjY0UHBRcURJTEdBUHRZ?=
 =?utf-8?B?Y1kyRHIyc0p6djhTeGZ3a3hYdDBBQlpmSjFwQ1NZZlVycDYvRVN4MFc2bFJC?=
 =?utf-8?B?QVdld0NIeTd2UVFZSFRsZDZuVEVTQVpmcXdOTEdya3hyQU5GbGRWS1BYcEhy?=
 =?utf-8?B?NFo1Q0FLZ0lQVnBRT1VnNFd0MWxOTUlCb0FGUTMwNFFzRkdTdjVsUDhwZDZu?=
 =?utf-8?B?RXlWTGxzekYwYzlaelFmSDZJaVVEVHRlVjNjV08waUlicFlGY0p6SkVUa3Vr?=
 =?utf-8?B?cEQ4VGloZ1ZndXI3aHZFOS9FQkd2RFVHV1pjOWFXR3JrcG83eEF0UUZ4Slky?=
 =?utf-8?B?VG04Z0RNbUFiaVRjbCtseVAzZ08xK3pMMGdPZDJtYTBNWG1temw1RmMzcHpy?=
 =?utf-8?B?RHRJcDVXeksvVlpSR1BxRDZwZTc4T0p6V2xPbXRycTZqdkdlaU1tbEc0L1A1?=
 =?utf-8?B?SnpjMHZVZTJaaWlLRjdueGVrSUlIeUFNSTdnOTQrYWVHaGZEVWU0dGRrWXhv?=
 =?utf-8?B?aElLbnB1eC9sWDREandjcE1ST1dRaUVmaHdVSGs4dm1BdklWUWhYVk5CdGRm?=
 =?utf-8?B?ZHR2OHRoRnVxYjRHdGR6QkRwcUVLMlBWN1JWRDBaVTFEZVlRNXhoa255aUVW?=
 =?utf-8?B?VVorSjZaRFk4UXZYSCszRGJTaVg0c1QraUcyN0JwTUM1VEViQ1J2bUxWRzg0?=
 =?utf-8?B?R29zREdkTXpIZVpRNm42d2RnN3FURHUzR0ROamc3VFlyS3p4M1ViUk91WVVh?=
 =?utf-8?B?TnFVYVdnOGFwR3o0ZDRqcmc5MXBnZVJ6NEZyQWNtZ0Q3c21xbEl6L1lOQ2s5?=
 =?utf-8?B?NTJLR1ZlQXBnU2NBcFZPcDhyQzdWQmsxZXU4aUltNFBOVm5sUFZGZ2VyUXJq?=
 =?utf-8?B?NEZBdWtJRHZuT2JsdVR2cU9DOWVMY2Z1WU1qQ29JRjFHR2YvTlh4bnQ2TGEz?=
 =?utf-8?B?a0oySDhSRE8yN0kyRlRiWlpudXl2ZkhmRkZVbmUrelBiMHlLZ3JETFZ5akR2?=
 =?utf-8?Q?ustqkEGHg5qeMJ7n9cK5Rdg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9ef279-77e5-47c9-f795-08dcede847ff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:41:47.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN3fS2Zx2PfHO8GN1VaWWt8OYSSasPpRnBjHDg9BlgUsmMddxZF6h1+coFMHCN+rSp7AfafFn4QsLChhOMIGmEt6nQ03+c7n008u+KJzWQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 13:41:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5510

Hi Niko,

On 10/16/24 1:54 PM, Niko Mauno wrote:
> The VOLATILE_LOG_DIR variable was removed and it's functionality
> replaced with a FILESYSTEM_PERMS_TABLES entry in
> https://git.yoctoproject.org/poky/commit/?id=2f8806deb7655b37d6f8d12ff54680d6acf7a298
> ("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead")
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   .../migration-guides/migration-5.1.rst        |  6 +++
>   documentation/ref-manual/features.rst         |  5 ++-
>   documentation/ref-manual/variables.rst        | 41 +++++++++----------
>   3 files changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index 298ff3e250..f58de3156d 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -117,6 +117,12 @@ Removed variables
>   
>   The following variables have been removed:
>   
> +-  ``VOLATILE_LOG_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used instead.
> +   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
> +   ``files/fs-perms-volatile-log.txt``, which means that volatile log is
> +   enabled. Users can disable the volatile log by removing the value
> +   ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES``.
> +

I would recommend to always use :term: when we are talking about 
variables. The nice thing with that is that we should have configured 
sphinx-build well enough that if we ever remove FILESYSTEM_PERMS_TABLES 
from the glossary, it'll complain for those :term: references that 
cannot work anymore instead of relying on us doing the proper grep :)

>   .. _migration-5.1-removed-recipes:
>   
>   Removed recipes
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index b2ba731bb2..6e52dfce17 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -327,8 +327,9 @@ The image features available for all images are:
>   
>      .. note::
>   
> -      To make the ``/var/log`` directory on the target persistent, use the
> -      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
> +      To make the ``/var/log`` directory on the target persistent, remove the
> +      ``files/fs-perms-volatile-log.txt`` value from
> +      :term:`FILESYSTEM_PERMS_TABLES`.
>   
>   -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 32c9e7407d..37007aa202 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -13,7 +13,7 @@ system and gives an overview of their function and contents.
>   :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
>   :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
>   :term:`R <RANLIB>` :term:`S` :term:`T`
> -:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
> +:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`
>   :term:`W <WARN_QA>` :term:`X <XSERVER>`
>   
>   .. glossary::
> @@ -2988,26 +2988,31 @@ system and gives an overview of their function and contents.
>         :ref:`ref-tasks-patch` task as well.
>   
>      :term:`FILESYSTEM_PERMS_TABLES`
> -      Allows you to define your own file permissions settings table as part
> +      Allows you to define your own file permissions settings tables as part
>         of your configuration for the packaging process. For example, suppose
>         you need a consistent set of custom permissions for a set of groups
>         and users across an entire work project. It is best to do this in the
>         packages themselves but this is not always possible.
>   
> -      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
> -      which is located in the ``meta/files`` folder in the :term:`Source Directory`.
> -      If you create your own file
> -      permissions setting table, you should place it in your layer or the
> -      distro's layer.
> +      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` and
> +      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files``
> +      folder in the :term:`Source Directory`. If you create your own permission
> +      setting table files, you should place those in your layer.
>   
> -      You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
> -      ``conf/local.conf`` file, which is found in the :term:`Build Directory`,
> -      to point to your custom ``fs-perms.txt``. You can specify more than a
> -      single file permissions setting table. The paths you specify to these
> -      files must be defined within the :term:`BBPATH` variable.
> +      You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variable
> +      in the ``conf/local.conf`` file, which is found in the
> +      :term:`Build Directory`, to point to your custom permission table files.

I am not sure this is the recommended way of doing it? Shouldn't this be 
handled at the distro configuration level rather than local.conf? We 
really try to encourage people to do as little as possible in local.conf 
as they are not supposed to version it and this seems like the kind of 
things you would want to version :)

Aside from that, looking good!

Cheers,
Quentin


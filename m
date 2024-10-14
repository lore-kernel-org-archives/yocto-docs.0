Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB8DCF2597
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:48:45 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web11.52062.1728902924880985844
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 03:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KkCHenWH;
 spf=pass (domain: cherry.de, ip: 40.107.22.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efatVER1zatoT8pCC61Mx+NMf4XWVSYs+3kXn/S1P9gPTLamVEFiOXMfrCkqO6y4FoDoCjpa3TcSfqHUzjMuV7HdCml9pryxhDgY7OkNGbfl9unP7UvwucbpJpteFIjGqAGPxdk4ja7OSJ9Hm6A6ce/il07bYcaiajB7JppFNdzi9oH9gJLJ2co5gu/Fm0ky0cGvd6ip07SB5Nk6Hh/oMO1PFSKyR4l833z+jdhJFAnFyhcgXTFsp2nUqpiLviFGFwsMNrF2jgpf+w58DpGFaOizz+pjqDyqKUjRIChV++A6PnWYndh4hy13GTTzCI6ypXdw6WI4n+Bs8DufCUxlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgNFnoYTD1pIJQ91nCFNqbmO7gwe2Dl7wFSx6UiLaUM=;
 b=NWJQ5BxsJt8mojUv2Vjsz/b1qTTBno4qCnoBWDBHGOG6bR7tftQI3SGede3CwfY/a2OQUYYgIrQ/WgsKi4HI6r1U6CY2RG1DuLWdIEH7Kl8S70jgYPwWgexnxDZiUl5rmSL/N6uDsYTqfD0ovx09nahA/J1rq1r9/63jXKmpYIbqzpnIomRdngVVlgANFGvE59+EiXu86bIvTHL8+wf0gd2uHpxTzx5IMp2htXZnZHRzZAiY/gnp6z2yT/27513uja6I2Q8GA3QE1ZT3UX4s3KjHhqNfaojpe2F/JEEyHDxKXFOrrml2P+TM+kkFmtqTjWYM31ln2wWfYbhc1cJ2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgNFnoYTD1pIJQ91nCFNqbmO7gwe2Dl7wFSx6UiLaUM=;
 b=KkCHenWHqU0fVHSAg4WUWKd9GMTRpYE1SMSUzt/N9Ehfq3uSfAP9SOjOqTBD/qTHDWshOjZmKT/tPF3NAg3T1VH5qRxAMD9Z5elESkGV+maP7fTVXKxPWRy+Z/q25+CLKDzC+C649xs9hmuhpcI9zFdOy0IMBZ0B8yS0EPYjdgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7174.eurprd04.prod.outlook.com (2603:10a6:20b:11a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 14 Oct
 2024 10:48:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:48:33 +0000
Message-ID: <b6839774-956d-41f7-a86b-e62de9b6d201@cherry.de>
Date: Mon, 14 Oct 2024 12:48:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] ref-manual: Cleanup VOLATILE_LOG_DIR
To: niko.mauno@vaisala.com, docs@lists.yoctoproject.org
References: <20241011144847.1332607-1-niko.mauno@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241011144847.1332607-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c345eb-293f-4aa8-a653-08dcec3dbffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmlLVSszcmZQd2RoMDUyVVcra201VjkzdU1IUjBab0tKTzIrdGxnb1lWeWZE?=
 =?utf-8?B?NE5CdTQvRk9qV0ZuaEJtbHpmK3VFOWRhNzZldG52NWxKNDUzQXBzSGkrQ081?=
 =?utf-8?B?bU52R25LTkhRYWg3YVE5MG5QY3Q1OFZvMGIvdE40aURlQlYwaUF3VGxIcWpy?=
 =?utf-8?B?KzhZMTdtVE9ja2ZweTNRcXJIeG5SdDd6S004ZzNETHkvaFdVdXVsQkVRdXY0?=
 =?utf-8?B?UkpDRG4vaWdqNENMUjcydzU1WE9tblZXd1dDcFg2ajNod1Bad0JQY3U5Rjd3?=
 =?utf-8?B?UzQzNHR6SCtxZkNoQUpINHEwUWp3bTQyYUVsQzdOYzVlNGFLdnMzb3UwUnIv?=
 =?utf-8?B?Rm9OcVJScW9xbldEZkh6NEcvMGMrcXB3WlRqVjAvcUZabkxRTWJGRURIRXV4?=
 =?utf-8?B?bEVQalgxM2dxdmVzZk5DYUpQejBydmNKanEwSEM3VEhBWlp6N0tLNG10Ti84?=
 =?utf-8?B?R3Q3Z2dsenA3RWNGbkJ6bGl6MVY0enk2MTY4bTI2MWdLQitYWnVDV1VHVlls?=
 =?utf-8?B?OFZycWsxMXRWSG5Id3kxenY4SGJFYXhzR09JaXJtcmhSRUc1NWtKUWRGN2I4?=
 =?utf-8?B?TklCZmR6SDhuSHBzdTRkcGtVRSt0VUhtRWErVW9GZXhMU1VYYWQ3WjBTRGpj?=
 =?utf-8?B?VDFkS1JhZ3hXZUNhNTVqOTZZd25aZ3oyY2ZmQ20rRmw0RTdNYVlyUmgweE85?=
 =?utf-8?B?VTd1TlE0cGVBZ1AwM1o5Z2N2cFVnS2wvbkVzL1RjR1ZQRDhOZFNrWFRuWi94?=
 =?utf-8?B?TkRFSytNQWNkTGJwSEVZcHFUaTRJWk1LcDd0TlJIV0dCNkpNVzBIQlNseVpu?=
 =?utf-8?B?Rm1QTXZPbWRGL3ZpNm5SZWFvWXZHZnFOSnVLZ3FDc3FidWdib2tibjhzT1A1?=
 =?utf-8?B?U0dNL1pkSWp3d1AyN3Vrc0FNdDBWYzRKTHZYdWFQOUNKZFBsZ3BYV2hwRXR1?=
 =?utf-8?B?ZHdZY1JVSHdSSjVXc3E5ZFVLT2hUYjY0aFdLcVltWG1EdDBvKzZWVUdOQTha?=
 =?utf-8?B?dDN3VDNFQm10YnRpdUJkRUxVUHo0N2doT1ZyOG1vdVVWRkN0MTNWRVkzOGMr?=
 =?utf-8?B?Z1J6MEpkV2pWT29FT2FGbzBwdGM0dGRJZE1LR2VrRm4xd1pZVm1vSGM1R2JB?=
 =?utf-8?B?bUVNdWtBR1lEVHBNQlgwMGVtcmsyeWNHU3RmTVBYYzJnQU5BcEVHSTNERUdi?=
 =?utf-8?B?N2FvYmhEUzJTWkw5REdwV0ZCVkxZTVhIUmQrTUg5RXBYbnU3dW8wZ1k5VWJT?=
 =?utf-8?B?TDM5cXN4N2U2UUFMSjhGQUxXK2NBQjJ1MFpOTkhnVklTQnFaUktYMU1xN1B5?=
 =?utf-8?B?ZFJtZjBEY3RBVHVpNTE1Z25OeCtTMjE4b2tDdTRhSlFIZ0lFK3JvUVJBNlQ5?=
 =?utf-8?B?K0Foc3JMaVgwblRLMHQxZjBJbXlyL1Q0Q3NuUDNZcHNXT1pmUDY2WUo5WVJ2?=
 =?utf-8?B?MU0rVTJxQWFXUm5EWDhZazlxYmptNDc5N2VzM0NMMkF5Q3FtaHk0TjZFVVhI?=
 =?utf-8?B?ZnMvN2g3Z3BhYzNIQ1dpNElIbHNIU2x3c0RSWHRON1VNU1BIY09xLzRBY0Jr?=
 =?utf-8?B?N0dTcEUvbFl2T2VybUE1cnVUM2xTMDVwdm40VzMxWWQvYVFKekFCYjNnZ1dM?=
 =?utf-8?B?aWM0cHhsaDN5c0lVbmFtdStZSFlVdFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGYyK1hwOWliS3BmRUx6a2JSNmVBVGNldURGUjRFclJGeGtOR0ZRNUYxRlYr?=
 =?utf-8?B?bDg1K1ZWMUdkNzV5Nkh2aEpzSHNQYTdKSXlrM0l5aDBpVDd4MzJkZTMrU00z?=
 =?utf-8?B?MjdUcWNEL1NrSVRUN3ZYYUJxNlhkL21XNUh2MXVoSGRuOUgxdDI2dHNzT3c5?=
 =?utf-8?B?U1IzcXNNNGZ1VnEvaE5NeXZ2VVFTVy9zczIyNkxENjg0eDNjMmxPMFNUYlhj?=
 =?utf-8?B?RDRXQkk3czNOSnZ4aHhxRHJ3ckJFSkd6a25Ra0trSHNNaUtYaDlESjAxZy9O?=
 =?utf-8?B?Q0dwNjhIcWRPNktLNXBFRjUwcnZjOXFzQUdBQjcrYTlFN2Q0OFkzTGJ0QkJ1?=
 =?utf-8?B?aEVUaitEdFdrUVBITGo5c1lxZzF4ejhqaGw0VTZ0L2pIV2hoSzFPY1ppbFNW?=
 =?utf-8?B?MC8rN3lRUWpDbDRkZlczU2pZNWNqRXA5N2dSYVdjemFUZFZsdW1SMW1UdzFP?=
 =?utf-8?B?a2RCR0VTT2g1VWkrcXQ3QjZITUhQWW1nRFRwUEYwRlFtVDdJRTVISXd4cXNU?=
 =?utf-8?B?SWRtR0o5SkpmQTJvWWJwOVRyZi9IbzZJd2J5TlZvVFVEbmFJcFdxbjhmMFZY?=
 =?utf-8?B?UGM3OGJ3emJVcHBoUVVNbzVFTVhMd05HWVlPckc5bno1cy9SRjB5R05DTVRE?=
 =?utf-8?B?QXhvbnpub21BZ0lOOHY3bE1YTjExWDZJT3BOcnJkTlQrZVpldWVuSVdFdGF3?=
 =?utf-8?B?Q2VxQzFiMGtldjgvNzFOSTVET2RwQ0lWU0t3OVVkclRpQk5EbDBxcUdNTHF0?=
 =?utf-8?B?MnJKMEJEM3FxOXhOb0F1UVcrVnpIOThHNXk2NDU4WFBIZUd0VWYya3NoNito?=
 =?utf-8?B?b2pkTVE1TmVmL3RqQXlDZWt4dC9ubVFIVmVUdVhQTFZMaWJHNFJFd2ZyTGZz?=
 =?utf-8?B?aWl6WlJIUitOS090VGcrUXF3eS9RREFMOXNFT1BoeG1nZmlneUw0dUFLUUlE?=
 =?utf-8?B?amVGc1NhcERYaCtpM1krQnh5Vm91OUtCdEl3RHhvczVVYVlnWUtsN0FUTXRq?=
 =?utf-8?B?cXBrVFVkNzB4QkJrc1pPQjQrcmsvbk5yT2dId3FDL25sbm1FWXpsbWRiSVpV?=
 =?utf-8?B?YlB3NzkxcUFBMjJGUmRsbitCMkdtb1M5U0pWMTR3TE8zcUh6RVhqTnUvQ2NO?=
 =?utf-8?B?RzhHTWFhZFBwd3c5Vkorc2VnbVltd3JOOVJoZTcyV0xlSTRyYlFQMVlRei95?=
 =?utf-8?B?QjBUSnRrSysrVm5XUnZ5L2dtRlVVQUxvOU9xUm1HU1VoRkE3SE5VVXVEbllF?=
 =?utf-8?B?VWZ3c2VtazVHNzl1QTNwZWtLQmE2VVphNmdwR0VFeTJaS1Jkdm1vZ0ZBbURI?=
 =?utf-8?B?ZmROSGFuY3FGZVF5clcreFRDdkczbWNnT1pvamtDd0NlYmgrc2lpMk1qZjB2?=
 =?utf-8?B?akxNUEFiQW9QRTVnT1crdkRyaEREWDVmWFRYelFiMGtzdXpBT1Bubjh4ODJw?=
 =?utf-8?B?NHM4eW83QktjYjFMd3dqMElHYkkxYnlzM3JZdVB1VTRyN2cxWHJDaTVqeW9i?=
 =?utf-8?B?QmV4RlpldEVES1ZyZS82Zkl1RGVUK0wwYmp4bHVEWWp2Y1JxNTZHR3ppS2pn?=
 =?utf-8?B?dXl1c0M2cjhrdksrOThKSWlXTjk2MVRDOHR6Ynh3Y3Z5bUQzSmZjK1k4WFFj?=
 =?utf-8?B?WGttMWZxMzl0dm9maWZaTTRDV3pwNzNqUnNnMHlSLzRkOFRmWGFEZlM0b2Rn?=
 =?utf-8?B?cEpzNW0raTcweWFQWXNRVS9sNlNVVmU0cXVjMWl1OEpCU0FGbG10UVJEOGJS?=
 =?utf-8?B?aS9VUWhRTldweVNkN29HUUtFSGw0Zis4c1BDbmljcVgvV0h2dFd0SUt2M3k4?=
 =?utf-8?B?VTFRMmVURCtIQ09sT0dNbkVsMEc3RGVzdTdxVGFia1c3dklxV3EvZFd4eWUr?=
 =?utf-8?B?NlovU3V1dEU0d2tITzJtWUY4YjN6bVpPcjhBbWtweDluREwxVWg0TVVjR3RI?=
 =?utf-8?B?OFUvWmNuS0VaRXluSTRmRlRocWRvaFJodE9ZOUpVMWRlL0VKSTFzMEY3SVpZ?=
 =?utf-8?B?RFBaYXRFbUV6Qks2MmJhSmNoUVJEWGxlUEhNNXkyekw0K1Q3SFBwdTJTK29V?=
 =?utf-8?B?RUNqa3JONHVvY0RZSlIzdjIrZ3FTMEtubFBqb0o1aGRPaWRlUU1lUkU1TjU2?=
 =?utf-8?Q?HP1mqmTDuW4ruq8f4CGmsZj7Y?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c345eb-293f-4aa8-a653-08dcec3dbffd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:48:33.9178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6KC8XOqvY45Ekg8ogxA33QcmD2lx36lD5Ae5JDc25QVJf+lyoVdxOh2pWurqwiPuU/68+qyxZUdcVLtp+gAdiMwqNyBr2Xdy3dJcBRXpeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7174
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 10:48:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5478

Hi Niko,

On 10/11/24 4:48 PM, Niko Mauno via lists.yoctoproject.org wrote:
> [You don't often get email from niko.mauno=vaisala.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This variable was removed in
> https://git.yoctoproject.org/poky/commit/?id=2f8806deb7655b37d6f8d12ff54680d6acf7a298
> ("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead")
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   documentation/ref-manual/features.rst  |  5 -----
>   documentation/ref-manual/variables.rst | 10 +---------
>   2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index b2ba731bb2..84ebfa81ae 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -325,11 +325,6 @@ The image features available for all images are:
>      the ``/var/log/postinstall.log`` file on first boot of the image on
>      the target system.
> 
> -   .. note::
> -
> -      To make the ``/var/log`` directory on the target persistent, use the
> -      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
> -

Please keep this and update it to explain how to do this with the new 
variable now.

I believe one should remove files/fs-perms-volatile-log.txt from 
FILESYSTEM_PERMS_TABLES as explained in the commit log of the commit you 
just linked to?

Can you please update the migration manual to specify what the user 
needs to do to keep the same behavior?

Cheers,
Quentin


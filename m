Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61124D1F9DA
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:10:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web10.23836.1729087822693077548
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cswt36/C;
 spf=pass (domain: cherry.de, ip: 40.107.22.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/N1BJRy0Wevd1vdf7YGE1jRbFJy4xS2o6Gw/uzBzEW0C/5Qu//036HbNUx0sAw3QgGuYwXc3pbFa1I1tHnabQvWjVkIKwhJkMqKFBbYacdmo/oWGai42gZk8by5SfgPdzHoP6HtudgKasLcXAyjs64AMB7i0HkrN57xOLJk/0qKebSRqjqEh2r31WNamuD46RcuAlIMblpxHHjf23HeytJ+MOly2fFfn5ET1/ucCmGVlrP4/nIRcFhqJJkY5oHuFM7obpxw+yRBOP9QLpC0Y4Y6NB0cCmYpqIoRnJIg3HM8JMcKTUJ9N0sOTOZPLbWHrQuDpsXLXxgO8rxG302sBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcAkR6+ziaDypLbvdmz2TknPvHk8qpWLIuGdQTWcthM=;
 b=LKNYxjQ4U2vLF8CM5RndWF6XRxRaDrH5k99uDl691lVcCHWpHrD6rDbbmethG8hr+1BRv9jduI1BzHNZJDSxvzHEjUH3DfbnnPpwysxIBMu++NEnYwpGH5MbmSodkCbKN2Jx6OrhsvzWMQ9qRQL/AMutA4lRm4nmJ8fwn2wGWG1YU49VMsyC8Y3ow/fXBY1JWgZl5KxcRB9V+S00yRUAOJU9unLyiDYz6NTly55KAAxzW9OkvcUI+j35RAPWRa1zlD7H/aKiFFvEBozTEZR/t0I/MBdZkfC07LnrTwVFtsdtEkAVeX3rfz9Yq4zM9RUxc1NTAeqQPDW9UgAZWnrwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcAkR6+ziaDypLbvdmz2TknPvHk8qpWLIuGdQTWcthM=;
 b=cswt36/C8358H2eoQJbST9uZjgpVaZszV0mc0eXnKnnJSc+ul1+XYNavRtJn82gfD0iXtqH+84+5pssjSCmV3PbjgQBtOq/V0ukGvHXM3TSSdswzDbF8KSnMwex5bZxQ25Sl7CPq76zHhsPLMRBB/DC6SVjhZ6ZP5+5+bRvQalM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7204.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 14:10:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 14:10:14 +0000
Message-ID: <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
Date: Wed, 16 Oct 2024 16:10:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] overview-manual: concepts: add details on package
 splitting
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e24ccba-453e-40b0-f481-08dcedec4182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q21jcGtWdmRsaXc4d3pZMkVLL3BBYXRxUXZVZHJCZ1JYR2x1dTBodDZZcDRu?=
 =?utf-8?B?UTc5YXpJVWdnQXJCU2E1NzQrWjNodXJlb1J0N0VOaDdLek16YW4xbE1iMXJZ?=
 =?utf-8?B?VEdGNmNESFhqZ0ZjWDVKdVNRVzVaaVBUOFRvY1RuVTFpYmY5ZVJXS0g2aGtJ?=
 =?utf-8?B?R2JYZlJCM3g2Y1lDeHg4enJEamM3bm1ua2JHdFBNV1g1VkpKZGFtQmlzZW5h?=
 =?utf-8?B?ZzBFa1JvRUpZbWt0TTJvRUgzM0lGZTNkWlMwenBvbUhFek5BV0JzOTBFS2hL?=
 =?utf-8?B?QTBtQjJPbHNkYkJnQTJSbG1odjNEY3NpSWhRYlZ5TkZycTRQVXpvV3N3dHF3?=
 =?utf-8?B?WC9adjBTTXdzQ2NOQXdrRHNWRExldmRsNitNSmwwcGZENW45azNSNThZbWw5?=
 =?utf-8?B?RUU1d0dKeWJKc29YdmRMS05hNldEdVpUdHBveWJUMitwellHSnpYYVVBa20w?=
 =?utf-8?B?cGtoMFZwUVg0c2tORm1DanBxTFN0cHJ5MDdnQjF3dzl5SXRDeklVck54WVlW?=
 =?utf-8?B?YnhkQ243MDVISlVFVU9rV0g5dXJDLzNWMlhiQm1MSlpoWnlVdlBZTUJPWUc4?=
 =?utf-8?B?KzdxaFRVTHdnVzNZWHRQUENIdU1HVkVFNmJObVBHcW8rTzBPRi9rdGY0NnJm?=
 =?utf-8?B?SXZ6VS9iYlRnbnlmYzMvbXZzR3gzNWthcUV4NmVDQXBYVStRZ1dyOVNhZno2?=
 =?utf-8?B?amxtYkpsT25VL2VhMFYvcDlMYkNVNlJncjduZ3FrQlNONXYxMm1kR09yMHBa?=
 =?utf-8?B?aWRpcE5JdjZNV3k3dEhMcjcreklPLzRqQk9xRDAxK0JxY1dFNDlJZkhDUmNE?=
 =?utf-8?B?V0FCbnRMeTZEUVhOM2NhSDIrSjB2aGVnY3hIWHBXTHdVbXZTaVVlRmJrMndL?=
 =?utf-8?B?K2ZSY0NvdlBPMmp5cXJYWkFhc3Z1MS80V01oajRsOVlZMy9VbWN0U01ZS3ZS?=
 =?utf-8?B?QlRZaXI2MnQ0WmJFNThvUkdVMmVuQ2JxcHIways2SjBqeDBJd0tZc0V4SWFX?=
 =?utf-8?B?bHlXZzBtMHZsMWZKdk1oMDdXRXVBRWlheHk3ejJIWmJLTEZkejUvOFE2SUlG?=
 =?utf-8?B?eTVMSERZWWJTdXFRTW5SbkZDck1jVzVlV2lEck9yd0FYdGkySVY5SjlTNi9n?=
 =?utf-8?B?Mm94Ykl0ZTZWTGFBOTFHd0UvVWZNdTZDOFg3RzhCNUR5U2Q1OUdyRlVPRStV?=
 =?utf-8?B?WnVYZldiRVdhYVJoVWlpMmZnYlNOeTc3QWNzbGVPZVR5aUZtanRjcGYxaUpV?=
 =?utf-8?B?T0h3dlZLRXpTZlRHMTVKNUNQVGhheVRHdjhKK3F6WHYzenkwYmlLY0lJaHRG?=
 =?utf-8?B?RXpEOXR6SjEyUVZDNDEzL2Q1OGI0RjBBdS9nYUFYMWFIUWZaSjNQUWtTY0Vs?=
 =?utf-8?B?TVRoZXNMQUlFaXJNeWdnZldnOFpCRGZaRmhiN1MzUU44VERKQlY1Ky90OE0v?=
 =?utf-8?B?T1Ywc3psTXpxNWtXSjl4UG5TbVNKMjB1cGFXTEgzMHNUNjJqM1ZkMEFVaHRW?=
 =?utf-8?B?U3YyNGpIUTMvRDF1S1hxQ1JRdndsRlJpYjQ2TVY4aWdiVnRkb2Y4VzZlZDB0?=
 =?utf-8?B?NFN6SEc3b1RJcWYzc1NFY1RtczZBdWZ3ekk5MWR6bnp6Vmx5SHdMNHBvMEpZ?=
 =?utf-8?Q?NGR15OT58pnxXUvmpSWyfIfViUA7EkyD/VyTJ/4lDPHI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEl0SFZoVURGb2habTQ5MGs1TW5MM3NuYzNwbUhQcEFHODhHVXlBeXpWSDBo?=
 =?utf-8?B?Y21aNm5ZTm1WcjJ6eVJTZEd0b2FtNXZNbTlNZFN0enpzM1owSzJwTEg0TmtO?=
 =?utf-8?B?cStBd0s3ZUJyaXc1cWVCOTIxMGRpY3JHQzFNMU90TmZNb3lPeW1UeERLd2FM?=
 =?utf-8?B?dTB4Z29Kcm9GdExXV2tCN0pFTGNLOWc4Qkp6SUw4YnJaVEk1cnpqMnk2SG1U?=
 =?utf-8?B?S3hrR2tmZkZoSmFCbDNrcGVDNEw3ZGtNb3FKTElXYXZ0TGVpUFdOSGQzRmlH?=
 =?utf-8?B?N1pGaU1LMTdzS1BQUjdKSDRmaFNSRCtnMGh0eDZ1QS9MWVZXYkhmeHVCVVBn?=
 =?utf-8?B?eFdqZ2tHcHo3aytoU21KYm1mL0lLSTFZaVd6dGVhL1dnalVoVzd2MjBFMXpJ?=
 =?utf-8?B?bno0UWF5blh4OHRxcEx1NGc0RldvSzVuVG1sMS9hWk1vOTllNTdxOHplVVhO?=
 =?utf-8?B?b3FzbEhSdDd5NytOdFNaNTUrZHQzYXdRMyszdVE2UHVSenJ4Zk9Dcmh6NkxJ?=
 =?utf-8?B?MTJRV1R1L0NXQVlOT0J4SmYxM3JKOGpQd2VubkIxaWVZWWFHTFpTMDdzd2Ro?=
 =?utf-8?B?aG1uY09ZbnFxUDdEUlRaT29wQU1kcHE0U0l5TU45SlhvT0VGeHh3K29YNFVV?=
 =?utf-8?B?QTZFSnFIRW5WZW5wWXJKRG9TVlUyVG5oMzZWZk5uVU5vWkIxa29pVkhiWXR1?=
 =?utf-8?B?cUFna25DYmxWdnJsZ211SVU3bHUxTy9OUjhXd0FHQ2xyQ1JVNS9CTnEzYitw?=
 =?utf-8?B?WjRXd3B4b0YrQUV1UC9yWXQvRDZHSzhkUUZ5OExyVHlycEZQclpyVGlHb2J1?=
 =?utf-8?B?SWo1cHJZY3l1QkN5QWxhSUl1ZUtrWWVEZWUzaTNJd2xRbkp5Vmlrc3pXZGxX?=
 =?utf-8?B?R280dEdnekoyYzJrUkZKSng2R3o2YzZQVXdaZGw4NWhXRmJCa3ZSR1ZBemdw?=
 =?utf-8?B?TFZJeGlxb0h1RXJFMmE0TEZhSThHVXYyYnFnazNhOC9WM24xSC93aEFaaUZt?=
 =?utf-8?B?UU45WHhGazlCYmU3ZmwwZHB5dkU5QUFMY2pUbVFiNHpTWmwrTGpCbnFHVjRU?=
 =?utf-8?B?SFg2ejY1RWJ5cStFT0k0V2NNU1NLK1pvdXlSRUdJL3lqQTVmT0EyRGJDcmpo?=
 =?utf-8?B?NkRqa1F2aUpxSDQzWXZlRnUwYy9Bcnh2RTZaa2RmZ2V3b2JERjdMNXhrcTVR?=
 =?utf-8?B?bkoyMmptd1dWa0J5czdpcFlyTXZybVQyWGNMZms3Y3FxS0ZMUTFwVWRocEZR?=
 =?utf-8?B?eEpBZHFCNWNCaldrWnYzQzhyWW04K1UwL0NjZktPZkk1d1ZYRUpWeWJZVXYx?=
 =?utf-8?B?WmFjcmJMUWh4QVFqNkZtT3FHcm5WcDh0bndqdExmaWdzVEo2b3FJWHc4a2Vl?=
 =?utf-8?B?NWUvcTNvWk5vaVl0bmFha25DQlJSRUFXMDM3akJ4WERwSWdhM1cyclhIVitt?=
 =?utf-8?B?bnpMaE4vSmc2STlDR1dzYlc2RjdmSEdRRlVCT2pOS2ZNY1RyR25PVnkybFZl?=
 =?utf-8?B?NXJ2RHJJdE45SERWVnh5U0FzeVkwVEFVM0FqcS9mQ2tzVjhzVW42V3lYbEtI?=
 =?utf-8?B?OFV5M1lUL3lFOU9STzYwVFA2WkRFaG5jUWNoanovbklWem1RaW4rb1RDVDVh?=
 =?utf-8?B?Wld3VlRxb2xCTlNEUmVzZWhnNmpoaktoVlpkZkRqOWNRaDRLeGRaK2J0QjQy?=
 =?utf-8?B?cVBhV2JCbHhUWlcrMnVYOCtFRmorc3d3U3hVbWFPRDRsQUxad25ZbzZ4Rkt5?=
 =?utf-8?B?ZnBHT005VVVoYktxVE10djI2bDEyWCs0Sk85amUydzRxUjhpZG11d2Z4em1r?=
 =?utf-8?B?RG1hWDB2dDZwdjR0QWpoOHdxOEtwRUVMcVBIVmpvT29QRzBUTTlnQmI2UjRk?=
 =?utf-8?B?TUN2bzFyQy9SK2JLQUlzL1VTblVadjNtVWtIRkoyOHRVTDVONE5BeGdPUHFh?=
 =?utf-8?B?cG5WY1VPeTV0aVJYeE8zMFcwd1pxZ0h6Umtjdk9LVUVCN3JxT2RIc3Z0NFpi?=
 =?utf-8?B?c2J3YWhPa0xnTXJJRk9mOEZuSE9PbWJZKzNLZkEwdU40ZnNsUm1LUmFQdThQ?=
 =?utf-8?B?OU84eGVUejJob20vZlNFRVJzNVNlaktSY0FSR081RFdWRzJBc3RXWXZxQWVr?=
 =?utf-8?B?NzZDK056WmNISkljT3V4anBmVzhmaDdIbFdIREJoSjJMUElYaDlyMnBScGFx?=
 =?utf-8?Q?aINIy6vAdlulk1/pjf4ews4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e24ccba-453e-40b0-f481-08dcedec4182
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:10:14.8068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eguWepXOA0GiSM8uqsEkyzmsaUx3OWijaZO3Jjaw/a7SjMU+mgQw9V59BlAVltd9pdCWxLrrKvJUEpOxCAtWXW5pCxT/R0QTOVWkrlC0P5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7204
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:10:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5515

Hi Antonin,

On 10/16/24 3:19 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The package splitting section of the overview manual currently lacks any
> explanation of how package splitting is implemented and redirects to
> the package class, which is not really understandable for newcomers to
> the project.
> 
> This patch adds a short explanation of what is done:
> 
> * How the PACKAGES variable is defined.
> * How the FILES variable is defined.
> * How the two work together.
> * How to add a custom package.
> 
> This should give enough details to a new user on what package splitting
> achieves and how to add a custom package.
> 
> Adresses [YOCTO #13225]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/overview-manual/concepts.rst | 49 +++++++++++++++++++++++++++---
>   1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 62f2327a7e27a777f738523e7fafe62422186abb..d3e90b80d4fe1954c7aacba8f0fe243cba04c1b5 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -912,11 +912,50 @@ the analysis and package splitting process use several areas:
>      execute on a system and it generates code for yet another machine
>      (e.g. :ref:`ref-classes-cross-canadian` recipes).
>   
> -The :term:`FILES` variable defines the
> -files that go into each package in
> -:term:`PACKAGES`. If you want
> -details on how this is accomplished, you can look at
> -:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bbclass>`.
> +Packages for a recipe are listed in the :term:`PACKAGES` variable. The
> +:yocto_git:`meta/conf/bitbake.conf </poky/tree/meta/conf/bitbake.conf>`
> +configuration file defines the following default list of packages::
> +
> +  PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> +
> +Each of these packages contain a default list of files defined with the
> +:term:`FILES` variable. For example, the package ``${PN}-dev`` represents the
> +development variant of the main package ``${PN}`` and its default list of file

I misread the first time I read that because I thought "and its default 
list of files contains development-oriented files" applied to "${PN}" 
and not "${PN}-dev". I could suggest simply adding a coma:

"""
the package ``${PN}-dev`` represents the development variant of the main 
package ``${PN}``, and its default list
"""

Just a suggestion though, could be that it's just me reading it this way :)

s/file/files/ in any case.

Additionally, I think PN-dev does not represent the development variant 
of the main package, it represents the files that are useful for 
developing an application depending on PN main package. Using "variant" 
seems to indicate that PN-dev could be self-sufficient and potentially 
have the same binaries/shlibs than in PN but compiled differently.

> +contains development-oriented files only::
> +
> +  FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
> +                  ${datadir}/aclocal ${base_libdir}/*.o \
> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
> +                  ${libdir}/cmake ${datadir}/cmake"
> +
> +The paths in this list must be *absolute*, and must use the path prefixes

There is a very important piece of information that needs to be added 
here and a source of many newcomers' mistake: these are absolute paths 
from the PoV of the root of the filesystem on the target, NOT from bitbake.

Indeed, in do_install (and do_package, etc.) we need to prefix our paths 
with $D (and $PKGD/$PKGDEST) when installing/packaging files, however, 
FILES doesn't not need those, even more it should NOT have those.

> +defined by the :yocto_git:`bitbake.conf </poky/tree/meta/conf/bitbake.conf>`

use oe_git here instead since bitbake is maintained by OE folks.

> +configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc. They can
> +optionally use wildcards (``*`` ) to match multiple files installed in a
> +directory.
> +
> +.. note::
> +
> +   The list of files for a package is defined using the override syntax by
> +   separating :term:`FILES` and the package name by a semi-colon (``:``).
> +
> +The order of the packages in the :term:`PACKAGES` is important: during package
> +splitting, going from the first element in :term:`PACKAGES` to the last, each

I would say leftmost to rightmost as we have some other variables that 
go rightmost to leftmost (hello OVERRIDES :) ).

> +file matching a pattern specified in the corresponding :term:`FILES` definition
> +will be included in the package and *excluded* for the remaining packages listed
> +in :term:`PACKAGES`. As a consequence, custom packages should be added using the

I could suggest:
"""
A given file can only ever be in one package. Therefore, the first (from 
leftmost to rightmost in :term:`PACKAGES`) package for which the given 
file matches a path from its :term:`FILES` will contain the given file.
"""

Still a bit too complex of a sentence but couldn't come up with anything 
better for now.

> +prepend operator (``=+``) to be prioritized.
> +

I am not sure it is wise to say "prepend" operator as we have three ways 
of prepending:
- =+
- =.
- :prepend

But since you explicit which one you're talking about, I guess it's 
fine? The bitbake docs only says "=+" operator apparently: 
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-with-spaces

Also nitpicking, but it's not necessary that a package be added with =+, 
e.g. if it should contain files that aren't matched by any other 
path/pattern in other FILES. But doesn't hurt to say to always do it.

> +For example, to add a custom package variant of the ``${PN}`` recipe named
> +``${PN}-extra`` (name is arbitrary), one should write::
> +
> +  PACKAGES =+ "${PN}-extra"
> +
> +Alternatively, a custom package can be added to the
> +:term:`PACKAGE_BEFORE_PN` variable::
> +
> +  PACKAGE_BEFORE_PN += "${PN}-extra"
>   

I would more recommend people to use PACKAGE_BEFORE_PN than the PACKAGES 
=+ scheme. The reason is quite simple, most people are used to += and 
using that instead of =+ could easily be missed by reviewers.

The former is only required if you need to have files typically in any 
of ${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale, 
in another package.

That's my opinion though and both are correct (and both should be 
mentioned!), so that would be fine to keep as is.

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D952CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:39:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.14])
 by mx.groups.io with SMTP id smtpd.web11.16411.1761323985293897649
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=n2Z8dOK1;
 spf=pass (domain: cherry.de, ip: 52.101.84.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+YulCNcr5A0t5UNkKIklkFvToVrI7owuHs88aidc3IVFU18hyXEG+Qu076z9PADd0tY8lgnMtutv2eblJ296+vMkuW7l9+vK8Pfwwzu6EUeF4Q7eOu6rbkRSLA4N/+2SjJ1BFz+UKVjXddMtPLPqEBYuQ6djW1+oujDgu6ukvT5KLtepvk4pDgOBnDMmB9B8goAW+8RX82heD6XpSJuSlZOHMJp30c9e097hTqVNUxflrJwRdsLPUeD1SAcptO6SSV6RAqgL/oNZBfGYETXxsyJ4Pv1PPtqJ4iSAF1eedz9Fk/nt7UBl8j7wO1qi5DPeSp98H1S8NYNuxIdxrkGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OE/leowJasQ36nJDLJImP6+vkiu5Dlr44hoFbwuKkv4=;
 b=ffcsr+RAjbgqIFTOAOq3IRwzT9XbLdNBJ+ETopS3sjKpr1VRUrBUFTzPX9JDaRk4hj2LGzVN8xEFaNlZdEMHugnvumv3mus1PkH2aEjCU3sRxiqkqqKkV1E7NVsIKTwaAbV1RaTGWT9vMfPAVS3HfKSH2vXF3C0QCsObSv8kgYFAf4Mw2+ubcXNg2o0IdlvEQRENcXw9J9M9b4Ly+JPd7VIb1dW6Jhc5DO04AWCYV4GPvAfFZ4y0/3PQwXYuHQKpBjw+RCJBITQNZjZEg4eioS0C9E8xbYtCv+b8q+R2Jci/kqN8U3rvEjFG4xwZz3nxcO/ryBDyO/TfZ4IVxIgODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OE/leowJasQ36nJDLJImP6+vkiu5Dlr44hoFbwuKkv4=;
 b=n2Z8dOK1QhyPQ1cbhsyF9eQzQskfxC7vhMG/9VK6ljmMM4oc4OSFxPbUc40l1JmpurToSDliZdIeSXoZzV9a7lxK71xGf/ChL3pt/AntSMeUNcZWR3ADp8tSe1vTM9tLr/w+7sB1XNg/KKhBOhduGV5d82BWsfonOwndRFqhls4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10575.eurprd04.prod.outlook.com (2603:10a6:10:585::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:39:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:39:41 +0000
Message-ID: <c1081d9c-c5ff-4f39-ba54-e9a502f077de@cherry.de>
Date: Fri, 24 Oct 2025 18:39:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 16/16] migration-guides/release-notes-5.3:
 updates
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-16-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-16-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: f2183850-6c19-4fa2-6b99-08de131bee1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmRWSVBoN0JQRlE1N01Ra3BvY293VkFtR0NiQ1hoNEYybWt3Q2Y1S3RNMkJF?=
 =?utf-8?B?enova1BTT1pWQnMzNmgrd0wvQ1c3KzRhMWRuYVM3a2tEMlNRUTV4MGQ1ejVW?=
 =?utf-8?B?NTBjaHJBQ1VuaFl0STBWam1vQ1ZZNUhLSFRSZkIrSWUyZFdURHdQRWJCbG1h?=
 =?utf-8?B?QVNlNkZ2VFQwNHBYNmcxQ3RjQ1plVU05TGNlZ1MrZVdrZUpkcnRyWkRsb2R0?=
 =?utf-8?B?eEF1aWVXSkd3dkhlbFJKWEFSdVU4ejVwK2FNZEsvUkRzNXk0eTZNMUQyU3pT?=
 =?utf-8?B?dHl2bUtKcXlUWW9ORktCNUZhM2E5UU5hdUNOZ1lEd2hsOTdvUVpLUnc0YlYr?=
 =?utf-8?B?OUJ4T0N3VStYWDhZNW9DWTM1c3IyaUphdmJVQjdUcHFrV0MwMFQrUlo2cEF5?=
 =?utf-8?B?czNUQUVQS0tobFFsU0xpa29NYjV0ZlBWYVYveUF0bGEwV1BiRG8rQ204eHhD?=
 =?utf-8?B?NUppbDFkdEF1SCtLRkVaa01YVWd1NXNBOHBQdVNyOWdyeGM1UUlOYzRBSE1E?=
 =?utf-8?B?UmdBQmFTSHlCQlA2SWFrREpPRlA3UnV5ZmVRZ0luTjN2T1lJbzFJSHJaRVZC?=
 =?utf-8?B?TUFoNFFkZXdMNS9hRXM4YXE4ZFFXNXJQUEVTT2cvaDkxdUxXNUJPN2kveEEr?=
 =?utf-8?B?K1N3TGZWM28zbnRNN1NrWU45TTJURlZyZFQrb1VLNDhsTHdtVW9yZzZDdnZz?=
 =?utf-8?B?Z3U1dlRpKytwOUJIYnZwaGVxa09DNzB6a3FQYm5zR1lYUUNoaHJ2M2pId3pz?=
 =?utf-8?B?RzU0SFlnRHJINmFkOE44a1hKdXQ3SSs2SnZqWUZnVkVYbGVsUEIyQUJyQkll?=
 =?utf-8?B?UHRTdWcrL1M0aDRWS3p6ZnFjQkU1YTJxQ1ROZXpqL0hVcm5kYU1JM2NVbThR?=
 =?utf-8?B?VERiUEJjREZYTEYvVWEyV3l3dmViZlU2NWNhdjAzRGdzUU5lUXByRi8wTXkr?=
 =?utf-8?B?Y20vWGQzZnpna1FJeU5rc0psRE1ycENTbHo3YkthMVdIamY4V2MvczJkZUFD?=
 =?utf-8?B?MktUY2ZFL2xDbldlb2FwNTBSYWZwUFNmRVZvbFFtTi8xQWEweXAwS0NVVHY5?=
 =?utf-8?B?eVVmYWUzNlFmak1KNW9PalNkbDdvbEVFS1dJQWU3cHdubm1oVStRUnNqNVpw?=
 =?utf-8?B?QmdpUm95dzZXbWdlMGpZdm01SllTME4weVd4TDcycm5Nb3d3SmtncGZrTHVL?=
 =?utf-8?B?SmFEdkxBaWM3cFNBVDZNeFpzeldBbFI0eWh0NDFCb29yaDNyQXV6U0NKQjN2?=
 =?utf-8?B?SzZLYWc1R0FKQkxOdlZiOUE5dmdLZklWb2tFN2Z1UWNqQ3NxQUltSm1hdE5x?=
 =?utf-8?B?ZU9MUUtUNzRoUjB4WEVXdklnRU95RThEUGU5ODFDZFdhdjlpY1RsR3Fvd0tr?=
 =?utf-8?B?ZzQybWg5ZWl1YzFpU3Y0UDYvYjFYdDRvdSt0U3kydHNmd01yMlpTazdSZjlT?=
 =?utf-8?B?YWhOME1QbnRReTl2VTUrZWZXclRiWmxKTVV0cVFPTVRvcWdFT1FDeTdYa2Fp?=
 =?utf-8?B?bFJrRGhHQ0dDUVZuRGJpaS9XVTZZcStyQ21obGM0dE9qczFQRjRYenpmY3I5?=
 =?utf-8?B?elB0c1Q1WmY3QUYwK3NNVFhNWmI0WCtoeW9TSW1vUHI4amJvdlgwT2hZN1p1?=
 =?utf-8?B?enRqeUpGRUdUSmVGM0swSERPRkRYQlBhVHRwQ0dEV292enh6TzVNVkhCWTVB?=
 =?utf-8?B?WmoySDBaZTN1MCt2ZERJSXdUdG1OOC9mbkZPZGY5K2RtbWFzY3RHT0N4dWk5?=
 =?utf-8?B?U1Rta3ZEbHZES0R5SjRqRFJZQmJOTG0yNXRrZStUaDhyNlRHQlNpN0sreTlO?=
 =?utf-8?B?WGJEQ3dkaHVRNDFEUnJrenpxWkswbzNoUkV0MVlPUStEVmxGdzBjNWtVZ1ln?=
 =?utf-8?B?dDAraU5ENTlyQWNDc0xlZ1NaZHU2aWtwekhXeXRMdUs1U2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0dvRU5zd3U4eXI1N3UwTVpjRGx6T3J2bGptWi9TSDhUTlZwYjFxUlY1bG5p?=
 =?utf-8?B?bkNkK2tGUkpwZ0ZCUzczZU14TWZSditub1BCUStIQjg0TldrNUFLVDBuQWRr?=
 =?utf-8?B?OTduVmZoYkxrblIwRklFa0hqQkwrbHdVUGxHeGwvaTV6MWRVMXdaN2hFZmhj?=
 =?utf-8?B?YWJrOFBZb2p5M1oxamtBdVNQQk9VTFAzNU85c29uS3dYNm12a01UUzk1T0Fa?=
 =?utf-8?B?MHpUYlAyeEwvZ1ZOb2pFSFVnSXNBWE5DVVpiYTZRK2Q2ODVPSERTclZnL3Uw?=
 =?utf-8?B?WEFHeUpGRnJEZ2FWaDlTV2xGdnJGTG5Lbjl2Yytmd3BtNTRqSDFJRlpiNjFQ?=
 =?utf-8?B?aWorR1JXd1ZUcjY4Qng5ZUVZRnRuQXlpODlzS1ZOdUNyV2xYeDZuNGRtbzUx?=
 =?utf-8?B?VU84UjYwT0FRU2RLZTdIRmF2aHR1Y1kyVnQ5M2twaUlSSDJRRXE2ZlpiRXZo?=
 =?utf-8?B?VVV6WlFUK3I0ZlBGdzZpQzR3bDkyamVRWmtVSDBWd2lpcUdUTlAyUHZtM1pV?=
 =?utf-8?B?Z1lTK2ZZTS9CQzdJeDBOOHliNDltTlp4VjlpdlVnTVFvSXRsOUFKRjFWNyt6?=
 =?utf-8?B?b1VaQlRwQndTSzlNZnFCQUd6aVpIWVlCOTJ3cS80SjAyeEt3RldoOUZMb0sy?=
 =?utf-8?B?NlZqR2E3NUdtWUtrSTVEL0xQd0RKd1huVzc4RVVxaG9ZVExjaVlJZiswMi9D?=
 =?utf-8?B?VVRZaGhtR1N4OVNOekFxZHFNU1B3YVdKUHFWKytDVEtnaEZodExkeUhmN0dr?=
 =?utf-8?B?Mm1ZSDMzWm40Z29UK0xScXlTTE92TDFPeHlmc0toY1RGTDZPQVZQWExha0oy?=
 =?utf-8?B?cCt2bHIyWnpyZWpHTk1zVVgrc3JTL2dkQTkvemRyU2hTM094UjB1THdCZzVq?=
 =?utf-8?B?UTFQdWdzUU9ta3BPeTZqenhLNlE2eVd4R0x3NkFRSUlZRUwrUWdLVnpZKzdN?=
 =?utf-8?B?dzRSamR5ZTY5SFBweWV4VjdFbXV1alJ1OTE5amRCZHcrelhQMEt5OUdocEg2?=
 =?utf-8?B?RStYVy8xU2dOcEsyU1krUnhBbHBlaVU1SDN4VWR3VXhibExwaVA3dmdLaWpw?=
 =?utf-8?B?cmR4WUJWRVJVL2dqbTNGaVFzeTF6SnJMYmQzTy9zUEl0QnRFUWtUQzZ3SWNQ?=
 =?utf-8?B?WEIvcS9lTTJCYWhLeklVRTQ3WklQRUV3T3hORFZscDVkemkwUndrM1o4MFZ6?=
 =?utf-8?B?VEx4Sld0YlZVUmhadWVGZUk3VmpoMWI3dWJ5TW5kUE1mZFZGWmNHaExCZEpr?=
 =?utf-8?B?ZThabVcyUXkwWVhBSElPSFhISjI2V21Jdmw0NTgzanY0eXROMUhjRVhCejda?=
 =?utf-8?B?b1hrMkpvMnhlSS9pc3VJa21rbTJnSlhJcEFqcDZzWmNtY1o2WFpmZWJFQkZw?=
 =?utf-8?B?VEdVRHp3UjMyVlo4bllVOU83THVqaGxURlg0eUpjTUNvY2ExZFY3VDQyUms2?=
 =?utf-8?B?a0J0QjJ6c1o1NGlvdnh4MVhtR2RnbmFTeFJoZ1BNSGxoVXFxc2phcWlIcE1Z?=
 =?utf-8?B?d2tMWGwvTjFQUWwvS2xHUlE5RGdFSUNlUXVLVmIyTmp0a2g4VWNpZ0lRZHZH?=
 =?utf-8?B?WVZaY3I1YXNEZmVFRStub0FWSmFTOHRFVTJ4Zit1TC9NYlRBMHZYa29aMFZT?=
 =?utf-8?B?aFBhVFhtOVNIZzZZeTNybWZiL3hwV1k2UUNhZ2J6RENsR0hIUWdHa2x4aDh1?=
 =?utf-8?B?eGNNQVpRWnlHOUY4dUdoS0RlZEVmOHBlYk51a2UzemE3TXFaNFBGMnpVbXdw?=
 =?utf-8?B?eng1ekNMMVppcHE3SmFQVVNHeXpPMjE4TzVLcWdKYkFLSXBreTZ6RkZWdEYw?=
 =?utf-8?B?Vkt4SjRCaTAvWXRPOXgwcGhUZ0J4Z29LNFNPYWV2WkdQNnRBWGdWanZuMUpu?=
 =?utf-8?B?eEpJNkRXVUliUm5OZm1JcGtNVlV6aGdjdElXYnhlRWxJTTVrYnVCWS8xbHVU?=
 =?utf-8?B?eHhjbFpDUnlhd1JUemcwSVpMSDlBeHRSb1BLWDBINnM1S3M4cmdFTm9NSEhm?=
 =?utf-8?B?dzNYL2hYY3M4cVhDWkxkdENuSGpOb0VlS1lnK1ZISnplRFg5UFk1djNTajRy?=
 =?utf-8?B?Vnp3bUV5S3E4N2lrMGxTSFhFZ1NwU1R2a1Eza0s1bDdUSE1IZXJDUmYrbnF0?=
 =?utf-8?B?SlFXZUlEanA4cXNxQ1BUQnJ6MU1ramJUNkQ5WDRma3RRM2l3cE4yQkpDUnNZ?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f2183850-6c19-4fa2-6b99-08de131bee1c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:39:41.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1NoSH/69xXi3g+Bt/KybMA8sAWdlJ0w8mISrcxg0Tm/3vsu2ZxVQvoJnpQ2Wppy7dyx+MqXgom1VaNbkO3QxpfWFQ+zmoRWad0HEP851no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10575
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:39:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7836

Hi Antonin,

On 10/24/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Update the release notes and migration manual for 5.3.
> 
> This covers commits from bd4625cd4db0 ("build-appliance-image: Update to
> master head revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper:
> Remove running_pids and lastpids") in Poky.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.3.rst   |  47 ++-
>   .../migration-guides/release-notes-5.3.rst         | 331 +++++++++++++++++++--
>   2 files changed, 355 insertions(+), 23 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
> index 985712cb2..fc543c175 100644
> --- a/documentation/migration-guides/migration-5.3.rst
> +++ b/documentation/migration-guides/migration-5.3.rst
> @@ -134,10 +134,20 @@ To set back the "mac" policy in systemd (version 257.8 at the time of writing
>   this note), you should set the ``NamePolicy`` and ``AlternativeNamesPolicy`` as
>   detailed in :manpage:`systemd.link(5)`.
>   
> +Removal of unlicensed Linux kernel firmwares
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +By default, the ``linux-firmware`` recipe now excludes firmwares that do not
> +provide any license information. The recipe holds an internal list of firmwares
> +to exclude via a variable named ``REMOVE_UNLICENSED``, this variable may be
> +overridden if unlicensed firmware is needed. See :oe_git:`the recipe
> +</openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a complete
> +overview of the removed firmwares.
> +

Ah. Poor choice of variable name here :/ c.f. 
https://spdx.org/licenses/Unlicense.html

>   Supported kernel versions
>   ~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> -The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
> +The :term:`OLDEST_KERNEL` setting is 5.15 in this release, meaning that
>   out the box, older kernels are not supported. See :ref:`4.3 migration notes
>   <migration-4.3-supported-kernel-versions>` for details.
>   
> @@ -147,7 +157,9 @@ Supported distributions
>   Compared to the previous releases, running BitBake is supported on new
>   GNU/Linux distributions:
>   
> --  XXX
> +-  Debian 13 (Trixie)
> +-  Fedora 42
> +-  Ubuntu 25.04
>   
>   On the other hand, some earlier distributions are no longer supported:
>   
> @@ -174,6 +186,10 @@ The following variables have been removed:
>      :term:`BitBake` invocation and replace it with information about what was
>      built during the build. This was partly broken and hard to maintain.
>   
> +-  ``GPE_MIRROR``: this variable used to contain the
> +   "http://gpe.linuxtogo.org/download/source" URL, but was not used by any
> +   recipe in OE-Core.
> +
>   Removed recipes
>   ~~~~~~~~~~~~~~~
>   
> @@ -195,6 +211,11 @@ The following recipes have been removed in this release:
>   -  ``xf86-input-vmmouse``: It has a runtime dependency on ``xf86-input-mouse``,
>      which stopped supporting Linux.
>   
> +-  ``babeltrace``: Removed in favour of ``babeltrace2``.
> +
> +-  ``cwautomacros``: A long-obsolete set of custom :ref:`ref-classes-autotools`
> +   macros, not used by any other recipe.
> +
>   Removed :term:`PACKAGECONFIG` entries
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> @@ -206,6 +227,8 @@ Removed :term:`PACKAGECONFIG` entries
>   
>   -  ``mesa``: ``kmsro``, ``osmesa``, ``xa``
>   
> +-  ``systemd``: ``dbus``
> +
>   Removed classes
>   ~~~~~~~~~~~~~~~
>   
> @@ -269,4 +292,22 @@ Miscellaneous changes
>   -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayland`` is
>      now its own recipe.
>   
> --  The Wic-specific option ``--extra-space`` has been renamed to ``--extra-filesystem-space``.
> \ No newline at end of file
> +-  ``gdk-pixbuf``: drop the ``GDK_PIXBUF_LOADERS`` variable, which was part of
> +   the recipe's :term:`PACKAGECONFIG`. Instead the :term:`PACKAGECONFIG` can be
> +   modified directly to achieve the same result.
> +
> +-  Remove the ``meta/conf/distro/include/distro_alias.inc`` include file,
> +   which associated a recipe name to one or more Distribution package name.
> +   This file is not used and maintained anymore.
> +
> +-  Remove the ``nghttp2-proxy`` package from the ``nghttp2`` recipe as the
> +   ``nghttp2-proxy`` package became empty after an upgrade that makes it a
> +   library recipe only (due to
> +   :term:`EXTRA_OEMAKE` containing ``-DENABLE_APP=OFF`` by default in the
> +   recipe).
> +
> +-  Remove the ``util-linux-fcntl-lock`` package (in the ``util-linux`` recipe) as
> +   util-linux now supports the ``--fcntl`` flag for the ``flock`` command.
> +

``util-linux``

> +   Recipes currently using the ``fcntl-lock`` command should replace these by
> +   ``flock --fcntl``.
> diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
> index 417087e35..231fa6ba7 100644
> --- a/documentation/migration-guides/release-notes-5.3.rst
> +++ b/documentation/migration-guides/release-notes-5.3.rst
> @@ -11,10 +11,21 @@ Release notes for |yocto-ver| (|yocto-codename|)
>   New Features / Enhancements in |yocto-ver|
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> --  Linux kernel XXX, gcc 15, glibc XXX, LLVM XXX, and over XXX other
> +-  Linux kernel 6.16, gcc 15, glibc 2.42, LLVM 21.1.1, and over 300 other
>      recipe upgrades.
>   
> --  Minimum Python version required on the host: XXX.
> +-  Minimum Python version required on the host: 3.9.
> +
> +-  Host requirements changes:
> +
> +   -  The minimum disk space requirement is now 140Gbytes (previously 90Gbytes).
> +
> +   -  The minimum RAM requirement is now 32Gbytes (previously 8Gbytes).
> +
> +   -  These changes are mainly due to recent additions of the LLVM and other
> +      such resource heavy recipes. For guidance on how to limit the resources

"other such resource heavy" sounds odd to my non-native ears. Maybe 
without "such'?

> +      used by the :term:`OpenEmbedded Build System`, see the
> +      :doc:`/dev-manual/limiting-resources` guide.
>   
>   -  BitBake changes:
>   
> @@ -36,10 +47,18 @@ New Features / Enhancements in |yocto-ver|
>         -  ``az``: Add sanity check to check that :term:`AZ_SAS` starts with ``?``
>            to mark the start of the query parameters.
>   
> -      -  ``git``: Add the tag to shallow clone tarball name.
> +      -  ``git``:
> +
> +         -  Add the tag to shallow clone tarball name.
> +         -  Verify if local clones contains a tag, when the ``tag=`` parameter
> +            is used in :term:`SRC_URI`.
> +
> +   -  ``knotty``:
> +
> +      -  Pass failed task logs through the log infrastructure (use
> +         ``bb.plain()`` instead of ``print()``).
>   
> -   -  ``knotty``: pass failed task logs through the log infrastructure (use
> -      ``bb.plain()`` instead of ``print()``)
> +      -  Improve refresh rate of the footer progress bar.
>   
>      -  Add support for automatically promoting class inherits to deferred
>         inherits by listing them in the :term:`BB_DEFER_BBCLASSES` variable.
> @@ -92,6 +111,17 @@ New Features / Enhancements in |yocto-ver|
>         :term:`BitBake` to specify what to profile. Can be "main", "idle" or
>         "parsing". Split the reports in separate files.
>   
> +   -  A "filtering" functionality was added and allows modifying the value of a
> +      variable before its value is returned by :term:`BitBake`. The
> +      ``setVarFilter`` API can be used for applying the filters, but it is
> +      **not** recommended for general use. It was added for internal use in
> +      the :term:`OpenEmbedded Build System` in the :ref:`ref-classes-native`
> +      class. The list of filters that are allows are derived from a select

s/allows/allowed/

> +      list of functions that must be added using a ``filter_proc`` decorator.
> +
> +   -  ``tests/parse``: Add tests for ``include``, ``require`` and
> +      ``include_all``.
> +
>   -  Toolchain changes:
>   
>      -  The Clang/LLVM toolchain can now be used as part of the build.
> @@ -106,6 +136,12 @@ New Features / Enhancements in |yocto-ver|
>         The toolchain is also customizable on a per-recipe basis, using the
>         :term:`TOOLCHAIN` and :term:`TOOLCHAIN_NATIVE` variables.
>   
> +      .. warning::
> +
> +         The :term:`TOOLCHAIN` should **not** be set globally. For overridding

s/overridding/overriding/

> +         the toolchain globally, use :term:`PREFERRED_TOOLCHAIN_TARGET`,
> +         :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN_SDK`.
> +
>      -  Multiple recipes were pinned to use the GCC/Binutils toolchain as they do
>         not support being built with Clang/LLVM yet. In these recipes the
>         :term:`TOOLCHAIN` variable is set to "gcc".
> @@ -119,14 +155,42 @@ New Features / Enhancements in |yocto-ver|
>      -  ``bitbake.conf``: Drop ``lz4`` from :term:`HOSTTOOLS`, as it is not
>         required anymore, and the ``lz4-native`` package is used instead.
>   
> -   -  ``conf/fragments``: add a fragment for the CDN :ref:`sstate-cache
> -      <overview-manual/concepts:shared state cache>` mirror.
> +   -  :term:`Configuration Fragments <Configuration Fragment>`:
> +
> +      -  Add a fragment for the CDN :ref:`sstate-cache

`CDN` to follow our stndards.md

> +         <overview-manual/concepts:shared state cache>` mirror.
> +
> +      -  Add a ``show-fragments`` sub-command to the
> +         :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-build>`
> +         utility, to show the content of fragments from command-line.
>   
>      -  ``default-distrovars``: set an empty default for :term:`LICENSE_PATH`.
>   
>      -  The default definition of :term:`UNPACKDIR` is no longer
>         ``sources-unpack`` but ``sources``.
>   
> +   -  The default value for :term:`IMAGE_FSTYPES` (defined in
> +      :oe_git:`bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`)
> +      is now ``tar.zst`` (previously ``tar.gz``).
> +
> +   -  Remove the ``meta/conf/distro/include/distro_alias.inc`` include file,
> +      which associated a recipe name to one or more Distribution package name.
> +      This file is not used and maintained anymore.
> +
> +   -  A new configuration file :ref:`structure-build-conf-toolcfg.conf` is now
> +      used by :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-build>`
> +      to manage :term:`Configuration Fragments <Configuration Fragment>`.
> +
> +   -  ``bitbake.conf``: add :term:`TMPDIR` to the ``GIT_CEILING_DIRECTORIES``
> +      Git variable. This avoids Git trying to find a repository higher than
> +      :term:`TMPDIR` in recipes that use the :ref:`structure-build-work-shared`
> +      directory for storing their sources. This fixes reproducibility issues.
> +
> +   -  Changes to the ``genericarm64`` machine configuration:
> +
> +      -  Increase the :term:`Initramfs` maximum size.
> +      -  Install extra Linux firmware packages to fix Linux kernel warnings.
> +
>   -  New variables:
>   
>      -  The ``VIRTUAL-RUNTIME_dbus`` variable, to allow changing the runtime
> @@ -159,6 +223,11 @@ New Features / Enhancements in |yocto-ver|
>         deployed filenames. Users can now override :term:`UBOOT_VERSION` to
>         changes the output filenames.
>   
> +   -  The :term:`UBOOT_MAKE_OPTS` variable specifies extra options passed to
> +      ``make`` when building U-boot. Extra options can also be passed as the
> +      fourth argument of the :term:`UBOOT_CONFIG` variable. See the
> +      documentation of :ref:`ref-classes-uboot-config` for more details.

+class

> +
>   -  Kernel-related changes:
>   
>      -  ``linux/generate-cve-exclusions``: use data from CVEProject instead of
> @@ -186,6 +255,8 @@ New Features / Enhancements in |yocto-ver|
>      -  ``linux-yocto``: when built for RISC-V, enable features in
>         :term:`KERNEL_FEATURES` based on features listed in :term:`TUNE_FEATURES`.
>   
> +   -  ``perf``: Enable ``coresight`` if enabled in :term:`MACHINE_FEATURES`.
> +
>   -  New core recipes:
>   
>      -  ``python3-pdm``, ``python3-pdm-backend`` and ``python3-pdm-build-locked``,
> @@ -210,6 +281,13 @@ New Features / Enhancements in |yocto-ver|
>         to code blocks in Sphinx. It is part of ``buildtools-docs-tarball`` for later
>         use in the Yocto Project documentation.
>   
> +   -  ``python3-coherent-licensed``: License management tooling for Coherent
> +      System and skeleton projects. It became a new dependency of

`Coherent System` to follow standards.md

> +      ``python3-zipp``.
> +
> +   -  ``gn``: a commonly used build tool to generate `ninja
> +      <https://ninja-build.org/>`__ files.
> +
>      -  LLVM/Clang related recipes:
>   
>         -  ``clang``: LLVM based C/C++ compiler.
> @@ -225,11 +303,15 @@ New Features / Enhancements in |yocto-ver|
>         -  ``llvm-tblgen-native``: LLVM TableGen binaries for the build host,
>            often used to build LLVM projects.
>   
> +      -  ``lld``: the LLVM Linker.
> +
>         -  ``lldb``: LLDB debugger for LLVM projects.
>   
>         -  ``llvm-project-source``: canonical git mirror of the LLVM subversion
>            repository.
>   
> +      -  ``llvm``: The LLVM Compiler Infrastructure.
> +
>         -  ``openmp``: LLVM OpenMP compiler Runtime.
>   
>     -  ``kernel-signing-keys-native``: this recipe is used in the
> @@ -242,6 +324,9 @@ New Features / Enhancements in |yocto-ver|
>      -  ``glvnd``, which enables OpenGL Vendor Neutral Dispatch Library
>         support when using recipes such as ``mesa``.
>   
> +   -  ``opencl``: support for the :wikipedia:`Open Machine Language (OpenCL)
> +      <OpenCL>` framework.

Doesn't match what is used in Patch 02/16:

:wikipedia:`OpenCL (Open Computing Language) <OpenCL>` framework

> +
>   -  New core classes:
>   
>      -  The new :ref:`ref-classes-kernel-fit-image` class replaces the previous
> @@ -255,6 +340,10 @@ New Features / Enhancements in |yocto-ver|
>         maintain Go recipes that use a ``BPN-go-mods.inc`` and
>         ``BPN-licenses.inc`` and update these files automatically.
>   
> +   -  The new :ref:`ref-classes-python_pdm` class supports building Python
> +      recipes with the `PDM <https://pdm-project.org/>`__ package and dependency
> +      manager.
> +
>   -  Architecture-specific changes:
>   
>      -  Rework the RISC-V :term:`TUNE_FEATURES` to make them based of the RISC-V
> @@ -299,6 +388,16 @@ New Features / Enhancements in |yocto-ver|
>         </openembedded-core/tree/meta/conf/machine/include/riscv/README>` for more
>         information.
>   
> +   -  Add support for new Arm64 cores, which are represented as files to be
+CPU ?

> +      included in :term:`MACHINE` configuration in :term:`OpenEmbedded-Core
> +      (OE-Core)`. The new configuration files are:
> +
> +      -  :oe_git:`conf/machine/include/arm/arch-armv8-7a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv8-7a.inc>`
> +      -  :oe_git:`conf/machine/include/arm/arch-armv8-8a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv8-8a.inc>`
> +      -  :oe_git:`conf/machine/include/arm/arch-armv9-1a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv9-1a.inc>`
> +      -  :oe_git:`conf/machine/include/arm/arch-armv9-2a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv9-2a.inc>`
> +      -  :oe_git:`conf/machine/include/arm/arch-armv9-3a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv9-3a.inc>`
> +

Oh... well no then, not CPU. This is the instruction set I believe. 
Which you are very likely not supposed to use in a MACHINE configuration 
file but through an intermediate tune configuration file which are CPU 
specific (well.... on big.LITTLE systems it's a configuration file 
representing both CPUs, c.f. 
conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc for the 
Rockchip RK3588(S) which has 4 A76 and 4 A55. Don't ask me how one 
handles SoC configs with more than two different cores, e.g. Google 
GS101 with 4 A55, 2 A76 and 2 X1).

>      -  ``arch-mips.inc``: Use ``-EB``/``-EL`` for denoting Endianness.
>   
>      -  Enable ``riscv32`` as supported arch for ``musl`` systems.
> @@ -306,6 +405,15 @@ New Features / Enhancements in |yocto-ver|
>      -  Powerpc: Use ``-maltivec`` in compiler flags if ``altivec`` is in
>         :term:`TUNE_FEATURES`.
>   
> +   -  ``arm``: add a ``nocrypto`` feature to :term:`TUNE_FEATURES` to complement
> +      the ``crypto`` feature to explicitly disable cryptographic extensions via
> +      Gcc flags.
> +

`GCC` (capitalized and tick quoted)

> +      This lead to the creation of two new tunes:
> +
> +      -  ``tune-cortexa72-nocrypto``
> +      -  ``tune-cortexa53-nocrypto``
> +

Yup, typically necessary for Raspberry Pi 3 and 4 which do not have a 
crypto block.

>   -  QEMU / ``runqemu`` changes:
>   
>      -  Refactor :ref:`ref-classes-qemu` functions into library functions (in
> @@ -330,19 +438,40 @@ New Features / Enhancements in |yocto-ver|
>         machine's CPU must also be recent enough to support these instructions
>         natively.
>   
> -   -  ``runqemu`` can now run compressed images with snapshot mode. For example,
> -      with ``IMAGE_FSTYPES = "... ext4.zst ..."``, you can run::
> +   -  ``runqemu``:
> +
> +      -  The script can now run compressed images with snapshot mode. For
> +         example, with ``IMAGE_FSTYPES = "... ext4.zst ..."``, you can run::

with :term:`IMAGE_FSTYPES` containing ``ext4.zst``,

> +
> +            runqemu snapshot ext4.zst <image-recipe>
>   
> -         runqemu snapshot ext4.zst <image-recipe>
> +      -  Add support for the ``erofs`` filesystem types.

s/types// ?

There are multiple ones simply because of the compression?

> +
> +      -  The :term:`BitBake` environment is now a requirement, and the script
> +         cannot run without a successful call to ``bitbake -e``.
> +
> +         The script will also raise an error with the ``bitbake`` command is not
> +         found.
>   
>   -  Documentation changes:
>   
> +   -  Add documentation on :term:`Configuration Fragments <Configuration
> +      Fragment>`:
> +
> +      -  :doc:`/ref-manual/fragments`
> +      -  :doc:`/dev-manual/creating-fragments`
> +
>      -  Part of :term:`BitBake` internals are now documented at
>         :yocto_docs:`/bitbake/bitbake-user-manual/bitbake-user-manual-library-functions.html`.
>   
>      -  A new :doc:`/dev-manual/limiting-resources` guide was created to help
> -      users limit the host resources used by the :term:`OpenEmbedded Build
> -      System`.
> +      users limit the resources used by the :term:`OpenEmbedded Build System`.
> +
> +   -  A new :doc:`/dev-manual/hashequivserver` guide was created to help users
> +      setting up a :ref:`overview-manual/concepts:Hash Equivalence` server.
> +
> +   -  The QA checks defined in the :term:`OpenEmbedded Build System` were
> +      gathered in :doc:`/ref-manual/qa-checks`.
>   
>   -  Core library changes:
>   
> @@ -352,6 +481,9 @@ New Features / Enhancements in |yocto-ver|
>   
>   -  Go changes:
>   
> +   -  :ref:`ref-classes-go-mod-update-modules`: Update license finding to use
> +      the new ``find_licenses_up`` library function.
> +
>   -  Rust changes:
>   
>      -  ``rust-llvm``:
> @@ -362,6 +494,9 @@ New Features / Enhancements in |yocto-ver|
>         -  Disable the following feature through configuration
>            (:ref:`ref-tasks-configure`): libedit, benchmarks.
>   
> +   -  Add the ``has-thread-local`` option to the
> +      :ref:`ref-classes-rust-target-config` class.
> +
>   -  Wic Image Creator changes:
>   
>      -  After a Python upgrade, WIC plugins containing dashes (``-``) for their
> @@ -387,14 +522,32 @@ New Features / Enhancements in |yocto-ver|
>            :term:`BitBake` variables. This directory is usually found in
>            :term:`STAGING_DIR`.
>   
> -   - Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
> -     space after the space filled by the filesystem in the partition.
> +   -  The Wic-specific option ``--extra-space`` is now also named
> +      ``--extra-filesystem-space``.
> +

s/is now also named/has a new alias/ ?

> +   -  Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
> +      space after the space filled by the filesystem in the partition.
> +
> +   -  ``bootimg_pcbios``: move Syslinux install into separate functions, to make
> +      it easier to add new bootloaders.
> +
> +      The Grub bootloader is now possible to install with this Wic plugin.

s/is now possible to install/can now be installed/ ?

>   
>   -  SDK-related changes:
>   
>      -  Include additional information about Meson setting in the SDK environment
>         setup script (host system, CPU family, etc.).
>   
> +   -  Add Go to :term:`SDK_TOOLCHAIN_LANGS`, except for the following
> +      architecture on which this is not supported:
> +
> +      -  RISC-V 32 bits (``rv32``)
> +      -  PowerPC
> +
> +   -  Image-based SDKs can now include Zsh completions by adding the

`Zsh` to match our standards.md

> +      ``zsh-completion-pkgs`` feature to the :term:`IMAGE_FEATURES` variable in
> +      the image recipe.
> +
>   -  Testing-related changes:
>   
>      -  ``bitbake/tests/fetch``: Add tests for ``gitsm`` with git-lfs.
> @@ -402,6 +555,9 @@ New Features / Enhancements in |yocto-ver|
>      -  ``bitbake/lib/bb/tests/fetch``: add a test case to ensure Git shallow
>         fetch works for tag containing slashes.
>   
> +   -  :ref:`ref-classes-testexport`: capture all tests and data from all layers
> +      (instead of the :term:`OpenEmbedded-Core (OE-Core)` layer only).
> +
>      -  OEQA:
>   
>         -  SDK:
> @@ -452,8 +608,16 @@ New Features / Enhancements in |yocto-ver|
>   
>         - ``runqemu``: add new test for booting compressed images.
>   
> -   -  :ref:`ref-classes-testexport`: capture all tests and data from all layers
> -      (instead of the :term:`OpenEmbedded-Core (OE-Core)` layer only).
> +      -  General improvements of the parallelization of tests, namely fixing
> +         some tests that could spawn an unlimited number of threads leading to
> +         OOM kills.
> +
> +      -  A new SDK test is now running for Go after ``go`` was added to
> +         :term:`SDK_TOOLCHAIN_LANGS`.
> +
> +      -  Commands sent over SSH (using the ``OESSHTarget`` class) will now error
> +         when an SSH failure occurs. It is possible to ignore these errors by
> +         passing ``ignore_ssh_fails`` when executing a command.
>   
>   -  Utility script changes:
>   
> @@ -465,6 +629,8 @@ New Features / Enhancements in |yocto-ver|
>            patch files *must* include an ``Upstream-Status`` to pass with this
>            script.
>   
> +      -  Show the :term:`DISTRO` used when running the script.
> +
>         -  :ref:`ref-classes-yocto-check-layer` class:
>   
>            -  Refactor to be extended easily.
> @@ -487,7 +653,11 @@ New Features / Enhancements in |yocto-ver|
>   
>      -  ``buildstats-diff``: find last two Buildstats files if none are specified.
>   
> -   -  ``pybootchartgui``: visualize ``/proc/net/dev`` network stats in graphs.
> +   -  ``pybootchartgui``:
> +
> +      -  visualize ``/proc/net/dev`` network stats in graphs.
> +
> +      -  account for network statistics when calculating extents.
>   
>   -  Packaging changes:
>   
> @@ -496,6 +666,19 @@ New Features / Enhancements in |yocto-ver|
>         detailed information on the files used during the compilation and improve
>         SPDX accuracy.
>   
> +   -  When using the ``ipk`` and ``rpm`` package managers, give out more possible
> +      reasons about unmatched packages.
> +
> +      For example::
> +
> +         E: Package 'catch2' has no installation candidate
> +         catch2 is a recipe. Its generated packages are: ['catch2-src', 'catch2-dbg', 'catch2-staticdev', 'catch2-dev', 'catch2-doc']
> +         Either specify a generated package or set ALLOW_EMPTY:${PN} = "1" in catch2 recipe
> +
> +   -  ``package.py``: replace all files unconditionally when copying debug
> +      sources (passing ``-u`` to the ``cpio`` command in
> +      ``copydebugsources()``). This improves reproducibility.
> +
>   -  LLVM related changes:
>   
>      -  Like ``gcc-source``, the LLVM project sources are part of ``work-shared``
> @@ -532,8 +715,16 @@ New Features / Enhancements in |yocto-ver|
>   
>      -  Handle workspaces for multiconfig.
>   
> +   -  Fix upgrade for recipes with Git submodules.
> +
>   -  Patchtest-related changes:
>   
> +   -  Multiple improvements to the tool's :oe_git:`README
> +      </openembedded-core/tree/scripts/patchtest.README>`.
> +
> +   -  Don't match :term:`BitBake` Python expansions as GitHub usernames
> +      (``${@...}`` syntax).
> +
>   -  Security changes:
>   
>      -  ``openssl``: add FIPS support. This can be enabled through the ``fips``
> @@ -541,6 +732,10 @@ New Features / Enhancements in |yocto-ver|
>   
>   -  :ref:`ref-classes-cve-check` changes:
>   
> +
> +   -  ``cve-update-db-native``: FKIE: use Secondary metric if there is no
> +      Primary metric.
> +
>   -  New :term:`PACKAGECONFIG` options for individual recipes:
>   
>      -  ``ppp``: ``l2tp``, ``pptp``
> @@ -551,13 +746,34 @@ New Features / Enhancements in |yocto-ver|
>      -  ``openssl``: ``fips``
>      -  ``qemu``: ``sdl-image``, ``pixman``
>      -  ``wget``: ``pcre2``
> -   -  ``mesa``: ``asahi``, ``amd``, ``svga``, ``teflon``, ``nouveau``
> +   -  ``mesa``: ``asahi``, ``amd``, ``svga``, ``teflon``, ``nouveau``,
> +      ``xmlconfig``
> +   -  ``dbus``: ``traditional-activation``, ``message-bus``
> +   -  ``cmake``: ``debugger``
> +   -  ``libcxx``: ``unwind-cross``
> +   -  ``tiff``: ``lerc``
> +   -  ``freetype``: ``brotli``
> +   -  ``gawk``: ``pma-if-64bit``
> +   -  ``x264``: ``ffmpeg``, ``opencl``
>   
>   -  Systemd related changes:
>   
>      -  Enable getty generator by default by adding ``serial-getty-generator`` to
>         :term:`PACKAGECONFIG`.
>   
> +   -  Now uses the :term:`USE_NLS` variable to enable or disable building
> +      translations.
> +
> +   -  Fix deduplicated templates and instance lines in preset files when listing
> +      both template and instances in :term:`SYSTEMD_SERVICE`.
> +
> +   -  Stop enabling non-standard MAC policy when using the 'pni-names' feature
> +      (part of :term:`DISTRO_FEATURES`). Instead, follow what is provided by
> +      upstream systemd.
> +
> +   -  Install ``systemd-sysv-install`` when using the
> +      ``systemd-systemctl-native`` recipe.
> +
>   -  :ref:`ref-classes-sanity` class changes:
>   
>      -  :ref:`ref-classes-insane`: Move test for invalid :term:`PACKAGECONFIG` to
> @@ -573,6 +789,9 @@ New Features / Enhancements in |yocto-ver|
>         install ``libstdc++-14-dev`` instead of ``libgcc-14-dev`` to avoid build
>         issues when building :ref:`ref-classes-native` with Clang.
>   
> +   -  Drop the ``var-undefined`` QA check as it was not relevant for the
> +      variables it was checking for, as those are mandatory by default.

One too many for?

> +
>   -  U-boot related changes:
>   
>      -  :ref:`ref-classes-uboot-sign`: Add support for setting firmware property
> @@ -586,6 +805,11 @@ New Features / Enhancements in |yocto-ver|
>         variable to automatically set U-boot configuration options (for example
>         ``CONFIG_RISCV_ISA_F``).
>   
> +   -  Improve the way build directories are split when having multiple
> +      configurations listed in :term:`UBOOT_CONFIG`. This fixes an issue where
> +      two or more of these configurations were using the same directory for
> +      building (because these were using the same defconfig file).
> +
>   -  Miscellaneous changes:
>   
>      -  ``dropbear``: The ``dropbearkey.service`` can now take extra arguments for
> @@ -645,12 +869,79 @@ New Features / Enhancements in |yocto-ver|
>      -  :ref:`ref-classes-externalsrc`: Always ask Git for location of ``.git``
>         directory (may be different from the default ``${S}/.git``).
>   
> -   -  :ref:`ref-classes-features_check`: Add support for required
> -      :term:`TUNE_FEATURES`.
> +   -  :ref:`ref-classes-features_check`: Add support for :term:`REQUIRED_TUNE_FEATURES`.
>   
>      -  ``openssh``: limit read access to ``sshd_config`` file (set its filemode
>         to ``0600``).
>   
> +   -  ``barebox-tools`` now installs the ``rk-usb-loader`` utility.
> +
> +   -  The :ref:`ref-classes-setuptools3_legacy` class now supports the
> +      :ref:`qa-check-pep517-backend` QA check.
> +
> +   -  The :ref:`ref-classes-ccache` class now supports using Ccache for native

`Ccache`

> +      recipes when the local build configuration contains::
> +
> +         ASSUME_PROVIDED += "ccache-native"
> +         HOSTTOOLS += "ccache"
> +
> +   -  :ref:`ref-classes-python_pep517`: use ``pyproject-build`` instead of
> +      calling the module with ``nativepython3``.
> +
> +   -  ``dbus-glib``: include the binding tools separately into the
> +      ``${PN}-tools`` package.
> +
> +   -  ``dbus``: use the :ref:`ref-classes-systemd` class to handle the unit
> +      files of D-Bus.
> +
> +   -  ``dpkg``: add :ref:`ptest <test-manual/ptest:testing packages with ptest>`
> +      support.
> +
> +   -  ``shared-mime-info``: Now uses the :term:`USE_NLS` variable to enable or
> +      disable building translations.

s/enable or disable/control/ ? or simply "enable" as it's implied if 
it's used for enabling it can be used for disabling?

> +
> +   -  ``p11-kit``: Now uses the :term:`USE_NLS` variable to enable or
> +      disable building translations.
> +

Ditto.

> +   -  ``babeltrace2``: Enable Python plugins
> +
> +   -  ``initramfs-framework``: mount a temporary filesystem on ``/run`` and move
> +      it to the root filesystem directory before calling ``switch_root``.
> +
> +   -  ``python3``: Pass ``PLATFORM_TRIPLET`` explicitly when cross compiling to
> +      make it deterministic instead of letting Python detect the platform

it? what does it refer to?

> +      triplet (``${HOST_ARCH}-${HOST_OS}``).
> +
> +   -  ``pulseaudio``: Add the ``audio`` group explicitly if
> +      ``pulseaudio-server`` is used.
> +
> +   -  ``oe/license_finder``: Add ``find_licenses_up`` function to find licenses
> +      upwards until reaching a predefined top directory (as an argument).
> +
> +   -  ``mesa``:
> +
> +      -  Build Mesa's Asahi tools when ``asahi`` is part of the recipe's
> +         :term:`PACKAGECONFIG` variable.
> +
> +      -  The ``mesa`` recipe now declares two new :term:`PROVIDES` for Vulkan
> +         and OpenCL ICD. These virtual provider are respectively named
> +         ``virtual-opencl-icd`` and ``virtual-vulkan-icd``.
> +
> +      -  ``mesa-demos``: split info tools to a separate package
> +         ``mesa-demos-info``.
> +

mesa-demos != mesa, so should be on indented one indent to the left.

> +   -  ``vte``: skip :ref:`ref-classes-gobject-introspection` with Clang on Arm,
> +      as it caused build failures.
> +
> +   -  ``shadow``: Increase the maximum group name length from 24 to 32 (default
> +      value provided by upstream recipe, was previously hardcoded to 24).
> +
> +   -  ``udev-extraconf``: Speed up the ``mount.sh`` script by passing the block
> +      device of interest to ``blkid`` when getting partition label names.
> +
> +   -  ``piglit``: enable OpenCL support if ``opencl`` is part of the
> +      :term:`DISTRO` features.
> +

Not sure we need to alphabetically sort the list, but just wanted to say 
it's not :)

Cheers,
Quentin


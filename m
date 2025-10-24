Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8207CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:43:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.web11.15006.1761320600654244908
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=labG4110;
 spf=pass (domain: cherry.de, ip: 52.101.83.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezDdTXsM65RneFxpzHm2XjVG5wmzCu/oL5FgLyECJnsquaoNZlhq1moQsSRMN84zeau+VT1Na+h+1ibTlRdLbnDydgrmR4aMs1UnX6dW6/BThSNYQk20zpd8ArMV4IFbxggrFkZntygZy3sDRavBqEK0MDXuqlnKYZRnd54gCPUNicDE6EFoJl3aDnyASg44MLMHdP9JJDm4DG6RpSXa/x1txfAAfbRVcXxvpXmB3Ikmv2374G8CVp9u62XFVvNwDqJxhftf+pK+ZPFs10YqNZsfbJdxc8YnhwE/8VEuEBaopXAZk6uSqY9MNjqTgPU2ihgEGZGmPaQ6+b28Ch10TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zka/PDuOvlQfVEoYsuxhHzq5HpgDRlg58MOcsaN83vE=;
 b=ew6FTakR4NSy1i41Q49DLp3i1mmEkqoYwS8fvP+Whr55wFPiOe7ez/v6aN6FTwH6vJuIGVK31iLcDByoVG0E36ErxGryURgSyPlRPLn1TrCY4lODQEr+heEDuwRd5BGbRNKEY71HwE8+B2K14iOZ+fMKpNowVIQzai7alx8gkQgBluCkXQdue6MdOLfz6qp1cg5HZb/97sSww4trf20wTGcDZsstYy65hmRaYtuaGHl9fhHkJIK6nYIiy88by9Bf/Esv1O1bynfS+PEr97IFCPOnjyMLUzzQiTgXAclR9N7vbYe7Ct3QPy7LByuMypZpTuDkHjssS8R0/f9lYHpbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zka/PDuOvlQfVEoYsuxhHzq5HpgDRlg58MOcsaN83vE=;
 b=labG4110VuAeTXuR+U+ASUzUKrdz/r67Yy330X0B4GUR7d3df9c8jUCbuT0kqNxsPsPAwSwfTPSpGSvxE4cbr+TQSzDwunIErlRMozWmIYeR9ctLyLZHAEc5iU5xDixMsEniiMuvCbv/l/wkUeQhLQr5TUK7170/kkdzOUJG1QM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:43:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:43:15 +0000
Message-ID: <384bb7bb-929f-486d-bb60-865984f52d0a@cherry.de>
Date: Fri, 24 Oct 2025 17:43:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 13/16] ref-manual/features.rst: add entry for
 the coresight machine feature
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-13-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-13-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1c8f73-2b46-408c-7f77-08de13140bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VHJaWHlMUEZhYi9SMVVSRFQrSUdERDcveDVtOGxlc1M5RnZYb1VCQm9tWVdE?=
 =?utf-8?B?TW94aWNVNjhYM1RyMm5mZTZqK1JDRXlXTitJRkdFSitmR0pMS1g2YmM5RHBP?=
 =?utf-8?B?ME1jOUlrbS83Wi9TSUpnbnNEK0RvWmtPd3daWDVTNkp0UWpqZ2p2ZmdKeWor?=
 =?utf-8?B?MHBqR1F2cTRHYUVHREFqeXBSMzN5QTRxdjFhaUprTXdYcVh5cE43NGJqb1Rq?=
 =?utf-8?B?ekw1KzVQL3piS3dheHVOYTk3U0JZVVk2YnE4c3R3RHBHaVJTemFibmRiK3VG?=
 =?utf-8?B?M1d0ZnNEZ3VrVVRZSkFSa3VCU0xsR1FrdGR0RjhLWTBqNnFlQy9kRS9qNXJD?=
 =?utf-8?B?MFlTSk9WeGV1TE02NTVUZ2psaHJBcnN6VjA5QzAzVWZmTDdUMklJaWxtMUQv?=
 =?utf-8?B?R3MyYlFpY1VkT0ZjTGVlUyt2NERJVEMvdGR3RUFPQXJhMHFWak0zL1c4byt4?=
 =?utf-8?B?QS9EVFJuUk9PU2pCUU5iaHJUd2QydFU0c3NkZGFjWHpNUEdKUjRYd0JTTGZK?=
 =?utf-8?B?aExZRjdUWmlmWW1Oblo0NFFVTStIUTI4SXZYdzhCeExwa0diYUJFcm4xaHhl?=
 =?utf-8?B?b0N5aWFkdDhOcTNnS0pJdFJFM1cwczVmcWFZYUxvSEhpNmFsTVgreUo5ekZU?=
 =?utf-8?B?ZjBaVkk2UmdVZ1ZoZ3lZUVpyWTZiV0owNXZ2eXhNRkJiODRpeDV5WDlab0ZT?=
 =?utf-8?B?WjUvL1RlZ1c3QVFKOE43eUk1dVFUWXZiMGRzZVE4ZE8wMkk0dTF4c1dOWDZ1?=
 =?utf-8?B?c1pOSWo3a0hjTDNwSzFIT2ZTUCtRc1NLaFNoSjRHNzljaDRwQW41ZWNnYzgz?=
 =?utf-8?B?QlRWbUZpN3FZYjl1UkpLSHdsZUZtUlJWWVlHMHFqa1YrcnJ1MUlER1RwU2o0?=
 =?utf-8?B?Tm1NeWdkaVRHbnNwU0k0bU9TdDgySnFYNUhHRmszL0JOR090U1drOC9KS1JH?=
 =?utf-8?B?dGdlUTd3YWVYNzQ0aFJWU3U0bW5PL0c3NGpzcE1ROTFtUFQ3MWxBc1VjVW9q?=
 =?utf-8?B?eGRmTDFnWDBRRTZsdWYxSWQ4eGt4Y2ROQnJyb01JOHpKTFF2TTZaMlRubkVn?=
 =?utf-8?B?UlRlWm9qMW92U0ZNbnVTMDlCZkZNSkJCMkNVYmV2c0c3ZmVTS3dCL3U4b1NR?=
 =?utf-8?B?VWZKQ3JEMFI2aEtCbE5BdENQeUo0ZlBhOWxQUytQTlNNeEZXcExFUVRWZVhm?=
 =?utf-8?B?Yk1Td3BSNjA4ZkpuS0l4ZjVZR1VKcHFFdHNDUW9tc2RBUmhIWG1SbitsWml3?=
 =?utf-8?B?bjBxNGZNOEVSNFZwYTU3aUZJQnp0Zld1Y1NrRUUxWXIyampYeTd6ZWxXU1hi?=
 =?utf-8?B?WVVXa3F1dWlPQXdOZGxrVVRCNVQySFRDNmVqOUZycmpuZWptRmxtR0d0Rm5B?=
 =?utf-8?B?eTVaRit1R01jOTB1SG5xODlSN2RQMzVGNXJ2clA2NVo2bTYxaXFOK3FMTUMy?=
 =?utf-8?B?TG5SNjlsVVRNVGVnbTdFeTF4S255eUswejhHVFFDTXRDbm5mNTN6bkkwMk1m?=
 =?utf-8?B?bDhJT3g4RFdYSGt3Q1NLbys3TzFuaTdDdTJlZEp3OXgyVnUvbTZUWXIzMDV0?=
 =?utf-8?B?T3gxV0RmdG5DcUlWQmRWejJtVWI5Skl0MlYzNE15enFiOW8yUjU4K05kRHhp?=
 =?utf-8?B?WGhndjFyNGpXdHpEblFxRk1RTlV1Y0dJMWxDclNPVDJkV2hRU2FLMmRGUm9l?=
 =?utf-8?B?RWNjdHlaMmVJakNZRHdXb0VZUHFpZHhLelZFb1NqSkM2MkRzSTBzU2FCNnpj?=
 =?utf-8?B?VU1zeTVENnQzeFhrYWs0QlZZNVd4UHRhd01GTUxjZjVLSWtFam9SdzNSZnl3?=
 =?utf-8?B?MVczcHg3cmZrRG5nZ21jbzBiZGJyb2xZTGpjdUwzVXdDcDFZTkcwVFZYUzNT?=
 =?utf-8?B?NEttL3l1eDQ0dlZLeVdtSEI1aWRrSlNuamtXODZZR2lmYVgycWErYWlPajRp?=
 =?utf-8?B?VGVFZVVXWTEvemNhOEpkWC96VDVTelNxSk91bnhuOXhtUldzQlZaaDAwUXhF?=
 =?utf-8?B?c2Erb3dJN2RnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWJJSXdOeDBYdEMxT29uSThWT1RSWFArSnRtMDUxeDdPK20zdDU3b2JiT3hr?=
 =?utf-8?B?RXg1MytPMy9KUTV2UVlhMTg0ZGZJTVQvOHVEdTF4VVFoODNBMHFnN1NVbmdG?=
 =?utf-8?B?WjBxQ00zZlhGNGp4TWlOaFd5RDlrbFNpZnowc1FtVlh3bVNjNFljOUVKUnJs?=
 =?utf-8?B?R2lPOU5RczVMNkdmQjBtZ1F3MUQ3aFZTNk5xaDJaZkhNV2hUcXBIUjNuSENV?=
 =?utf-8?B?OUQxOWdVVFJ4WU9hS0pRYURjUnlSY1FKVnJndTl6clUvWk1FZWtHSHRXZmlM?=
 =?utf-8?B?YzBZWVYyaXJtRWRmdEhNZUNva21GUmdtSW9Pcms3eDZDWi9zc0MvU0ZUcFkv?=
 =?utf-8?B?TXowWmk1VWZOMFJidHFtdjlZM2hlaXJIbTVLT1g4WEQveVRDakpyRDBRVmh3?=
 =?utf-8?B?NGpzMXBhbFVlYzh3QWludlBFWmpWUTA0eFZYYWtxajZXSW9vRjdnYy9YTDJq?=
 =?utf-8?B?T2Exc085dVdzNGhJK1FQQlFvWUdlTUYyNDVsRStMK3VSZm53eWF6ZHQyRDln?=
 =?utf-8?B?VnZxM0g4UUhEZ1A2eTVFcjZtZWVzMlZRZkNOdkRETldldFVPcTd6V2lldWQv?=
 =?utf-8?B?YXh4azBCejJzRVZPYjZqSzg4SUIycENlV2V5aitkanpsRUE5dXVCWFhGNXl3?=
 =?utf-8?B?ZlFLQlRqRDQ4U3hhK21kNmsxVXBmRDU2NjRSSnV1QWxxRVZBblBmei9LSUNZ?=
 =?utf-8?B?MTBMRHdUTEdxa3BMRWRHREJIcCtBU0JDV3dxZ1d2eWlnRVYveUxTTE4yb1dq?=
 =?utf-8?B?eThPTlBiMkdvOXNPM0JzQUk0bzhWN3hneEtZK1B3aHI2Sm8zbENhaXpGQ1Az?=
 =?utf-8?B?Ny9vSzgyejVBbVVkK25aQUlUczV0T1VzSmVwZkxMVkVINzhVdnpQSHMrSDVK?=
 =?utf-8?B?RzJkcmdBTGZ5Tm1wR3JMeFBFRnJ4MVllZTA4Qy80TVR3UzRIQzl6Zkt4UWhk?=
 =?utf-8?B?eXAySHdxWVFBMDE0K0dCNmhNbXZ3Zm1Id2hHZXMrcUZZMWlacUZDOEpEOS9D?=
 =?utf-8?B?S01sdjVvOVpPVC96bE4wMmNLT1h3dVhwK1h3UXBTMTZSSmd3c3cxVTNwUHJx?=
 =?utf-8?B?YUtDZHY4SUU1TGszcDByM1BwdUQ1VkVBM2FmTi8zcU9BQm54VjlyeVNQNnRC?=
 =?utf-8?B?a0hEa2gzL1BPNzYwZGsxTFUya0Voczd2KzVuM20yaUlna0ZpdEFkY2NmallQ?=
 =?utf-8?B?aEQwZm1BcDNwTWV4NXlhUm1QL0RkSUxZVjdJbFREQXRyNnlIY2tYUGZTVUhD?=
 =?utf-8?B?RjQyeHBYeUgybnNLQ1J0OUNjYjVKdVRtaFVya0U3VkhCaDBlYjNKUVVEdm9y?=
 =?utf-8?B?YXhQZDkrYll3emRndVFNV1hRS2doVHdETDJ2Ky81ZnpiczRvbW4xZlV2Unkx?=
 =?utf-8?B?L0V5cWlzdWYvZld4WlZTV1hQamppNUZKMVpIcVhJRlRaK0EyUG45TGYrcnUx?=
 =?utf-8?B?aUxBbFhONkw1b2FQNFVhSS9hWGVyckV4bFY5SUozRC9RZ084M3p4S3ZjU0d4?=
 =?utf-8?B?WHZGNU1Wd0VYcm5JbGNFTFNTbjFkemdLeS91QW9XUmthVTZUWW5NWWkxaWZa?=
 =?utf-8?B?bnA2Nis5WlRqSzZ3a3Nid3VwS3FYb0UzdCt3U3I2R3ErRS9uT1BhMVNycTBz?=
 =?utf-8?B?c0ZPZys4MVRwT09PM1c0ZVZlaDJRWXlCZXg1aU9LOUVibnBSaHFlKzk4YjNS?=
 =?utf-8?B?OCtSc3g3eUh4OTgyMmlBZDd5VzVsV2g2RlpnMitnNFp0OE1qN3p1dS9tNHRv?=
 =?utf-8?B?bGs5VEp6V3NiZ3cyRm52WEF6SG43N2xCL081Q0RFbTVOOC9nbitFMzNaTXBJ?=
 =?utf-8?B?MnE0RCs0YVZxZEpxc2U2UEE5UzBLWXVlS2p2U3Z3YnVZcmhYMko3VWhhSHpt?=
 =?utf-8?B?VmgxTkZwQnhlc1A3bXh3ZERPcHIyVEZaV21ETlh3REdDbitZTVVWOXR1YS9M?=
 =?utf-8?B?dEJteHlBM1lITkhaK2hVRXJWV2g1OGMxLzUvSEsvQ1BWZHNOOXZZSVhOVUN5?=
 =?utf-8?B?WHhYeGRpU3NRMEg4YXpVRzlKVUVIZnpONUpBdVpheXlrMWxpVktBTnFDd05M?=
 =?utf-8?B?SEVVTEU2NG1ITHR6dHBJRU5qTFhCQ1Q1TVdUa2tVT3JIOFVyZnlNQlRhdTRI?=
 =?utf-8?B?NUZCU0FoWGU1UGsvZGJReE1aMXVOdUxKZVB5ZGZYd25YRitxYmJrYmRTMGkx?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1c8f73-2b46-408c-7f77-08de13140bb6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:43:15.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHtMN8zv8VHOYj0BJuZO8IqDSCVjHc5+ga6bNpu6UEraiCF+D24C3L5vcnezKNxvpP4Z1KgwL2titLtUg3t0W6vy7VOUx4yOftKRTyC5zAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:43:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7833

Hi Antonin,

On 10/24/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit c455bd039104 ("perf: enable coresight if enabled in
> MACHINE_FEATURES") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/features.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index b295ab44e..6bed23abe 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -54,6 +54,11 @@ Project metadata:
>   
>   -  *bluetooth:* Hardware has integrated BT
>   
> +-  *coresight*: Support for the `Coresight

colon should be before the asterisk (that is ":*" instead of "*:" to 
match the other items in the list).

> +   <https://docs.kernel.org/trace/coresight/coresight.html>`__ Linux Kernel
> +   feature on Arm processors. This feature depends on the ``opencsd`` recipe
> +   which is present in the :yocto_git:`meta-arm </meta-arm>` :term:`layer`.
> +

I think this is a mistake, we (oe-core/poky) shouldn't "depend" on 
features defined in other layers. (The PACKAGECONFIG is fine, not the 
filtering on MACHINE_FEATURES). But eh, it's merged so we need to 
document it :)

With the small typo fix above,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


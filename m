Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E1CD2F331
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:21:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61232.1768317695792825088
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VAUCBtWp;
 spf=pass (domain: cherry.de, ip: 52.101.84.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTvpGkZ5N51tZU3rFfdFbl8foz/vBrbOosPXUJ4EYrPtQEXCumAtmpPoVmysb5uAG+lo5llVFI7TS5nJCcH9WKnebLtUGc/wrkN7der4yKfOZBNsVuHr+t9Ptgg3OcCWty8pH4UCf1jNnP++XRuN5AxNrpAxd8a99KE/xtpjBevAhqp+yU1U1TFWElsv1OKCuIIqd5bG5MKtOsd5Pbwceh4jk/jq6qUOoQ/zYl68EUQue1hRgQ/mCUIHzWrw5HdeigVzBU/F1W4yyaktzh5KmDhm3YgY/11G+zrxJB9U6g4iZWomqSVTcIZkr2NjOoN54HRTSjEmWh9GCr4niIf7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m8Vnlkd0bJTHld7K5zjr0h67DFBuldKrx5tPAITSa0=;
 b=m/AkYmFIymh1ysPOLhzgg7lZzRMgFkcWQGWbICMXyY8YJ1TcIh6IWd6PbVh4KAI9IR0MOFYdzMIVyfnBBW63KCT61at4ocoEv3aGXq7LbfX0EJ/dlQVJEMjUSIF0UUqMRdg92Z35SSTQT8UYR15FWKrJzBgXFpx3pB6GmNCdH+KXTFVmNxgz693N0SpaLBwo/BFLcPXCQfT4y4R30mZQsmuAZhfkjQxNEIyIegXQHMuIBRWLm2onL8/Ynso4qBWIQMmo4ZHffABhmiz5TI4kwpLINjre5bCdcdLBEqfN4rPpt7qvmTgrihn6zdF43gGRcZ9I6O69zmo1csdvYSfo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0m8Vnlkd0bJTHld7K5zjr0h67DFBuldKrx5tPAITSa0=;
 b=VAUCBtWpS8xdvRPF0IZJN0QxsAvQ1hOpVkuVLZZYi2Wqhg3yca0cGxa3az40aAJLTj4ceFADI3e6qN0fjcLmU+F6meQzv72F02bfvUK/m4MKNoEJypKZ6r+OqYY5VtqFeSu3RY6iG2UWgBNkFHaEf23Ar6QafN4J1K+PTI4Y0fw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 15:21:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:21:30 +0000
Message-ID: <a72b99d8-1e8f-4efd-aec3-632667cf0eef@cherry.de>
Date: Tue, 13 Jan 2026 16:21:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 50/53]
 ref-manual/yocto-project-supported-features.rst: remove obsolete poky repo
 reference
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-50-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-50-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0379.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: de53e094-a89d-46e4-8f27-08de52b76d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzJZQXZDZUg1OXdzSnlzUmpuaEFJci9tbFIySXNNMmFBOTNSUmtHRU54cTdI?=
 =?utf-8?B?R09hL2k3V2V3UWVFWTNiWjNYUGF0SEhQK25zdWNyYnMzcG5TTUwxb043UGxn?=
 =?utf-8?B?eTN0MXZCSWV4dlJUbVYrREsva0FFVHZHTWxRb2M0VEU1NW9OalRuWUUrbHZS?=
 =?utf-8?B?eE1xV1JWK3NZajZ3bk4rVTlURnpoVU1LT1o5Vk0walc1eCtKdyszcVRDZUFP?=
 =?utf-8?B?eWYyWUJrV25WRWw0WVZiU2R1UXNSY1RiL2JwT0pCRmlxYVh4NENTUVdjQTNI?=
 =?utf-8?B?NXE5WHd0VW0xcXhiSHlkVnRPNWxHWGtsQnhnMkFUVDZjUHRPanloL1FiYkFK?=
 =?utf-8?B?Zmc3d2Y1VkU5S3lHZ2JoaEVMVXNyZkQvL2xxYmYrTXhYb1RMTzZ2VTF5QUJD?=
 =?utf-8?B?Rjc3RXkxbE93ZmpsL2twQnhxVlljMklRWlFGMnoxQU5nK04ybmw0akpMTVVn?=
 =?utf-8?B?bnE0a2tmOHRUdlhjZnkyY3hnQXZhQmdUM2VXSG5SVGlBYkNGSExCeDVuZENs?=
 =?utf-8?B?a2dtRFBnWldXcGtueUwzSHcyeFZ3cUtCOGlQYXJoTTRTMytkSlNCWnptT095?=
 =?utf-8?B?VHdRMytqNjQzSVJzblhocWFEa25HY0drRXZrRm5UUk5YT2tHOXZGSGVzZFFJ?=
 =?utf-8?B?YTA2RSthSFpFVHN1OHFxSk5TYWJkR1ZDWEp2dzcxWmJqcDVMMnhVVHNiNlQ5?=
 =?utf-8?B?aFlLRHVDaVJKY0c1aWtabnZJRW1kRkU2RkpWbnRmMzhmZkpYNTEvQUx6THFP?=
 =?utf-8?B?QmtQUTZWOVZuQUdwTGMvWlhHZ0tIOG5CdHpGeUhKRHdwTGdTMElTdzhtMkxY?=
 =?utf-8?B?RGV2Wmt2NHNHL1dQdUtIdVhIYUlxYUNRWm9NMlJXU1gvZ3lIL1NjK0hkclV3?=
 =?utf-8?B?ZzZsS1FWQ3JtUVZRZmVQcHBNcmhuL1plVmdFbE1uaEt1OW9ZRVJsdWRvdy8v?=
 =?utf-8?B?MUw2N1paTTdvSFJYNHcxRXJmS1BzNm9ibE93cFVISWJKQy96M0xKN3FxQ1Fp?=
 =?utf-8?B?Y3RLaXhabHZER2Z0UFdrSW1xdGZqa2NvSGo5eEdFUVFQeHZSVXc2Z1RpMmpY?=
 =?utf-8?B?Y0NJK08xNlVMUDJVcHN3WVYxRzhKKzVMbXFTQ1cyeXV3anIwdk1aTjFzZmJz?=
 =?utf-8?B?c0h2eUNwOXA3TllxMEdUUmZrYlNzZzVrRzEyQ3VqWGVjMnZscEN6bk11QkVX?=
 =?utf-8?B?RmhacVJieCtnSW5DdHMxYTNyUk1yTm9CdFlOY2srN09DbC9MWUMxTjA5d0Vu?=
 =?utf-8?B?aW5DV1IyUElUcGdUSWh2NHQrRW1MVWUwdGlJU2p1L2cvNUtKRUtiRmlXN29Y?=
 =?utf-8?B?a1E3Ni95R2JhZXBPN3RZY0xuR09IVys5cmlBbGRxQjFlV1N5VGNRVDRvVERK?=
 =?utf-8?B?MElWSUJkRTBMa0FvR0oxK1lBT0p1aVlJRjhkYUhXQzR3UDB6OEhFeW1maVVo?=
 =?utf-8?B?bDhFaUFnMWhtell5Tm9TUWxlVjJ1MG9Jbzh0NDl3VnZwZ2RXRitCKzQ4V0Vk?=
 =?utf-8?B?cENpYmFyU2NidFZTc0VVSmoycTd6SVgzS1FGNzhYWC85N256Wk5takJReWlo?=
 =?utf-8?B?YlkrT2VwSyswUks3ZFpocENZaWRvUllLMXdZUHQ5Njhic2FhRENpcjdpUlJ6?=
 =?utf-8?B?VVZReTBkTUQrL04rSWhIV2VUNVAxMSsyWlJZMEIwMlpseXFOekwzTVdZcEF1?=
 =?utf-8?B?SFV2Y1hiQUoyM1dOUklrR0RhODBtYmgwSWF4SzNWeTAxd0RFbGYrZVk4d25a?=
 =?utf-8?B?QjRhUHZ0dE8xKzRmazdxVWR1Z3g2ZXBicUpGMTR0QkdWdHZiMXpKMTRSMW1k?=
 =?utf-8?B?S2JrQ05oY0FDejJWOWpEQVdPM1NwV0U3L2t4a2V5LzhvTUU3bHc1cmtQeXpz?=
 =?utf-8?B?dFY5dWhPeHdoeGgrc1l0NlE1WlJ5a2FpcW1YTE5yeC9FL2I2WFl1eVBYV3lC?=
 =?utf-8?Q?RiSGqGMVpUuYEdXBy4FJE0RH0bkIJEUT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UURhNHMzbUU2dURneWRQckpIUG1hV0RxVmlMaE12bDBtcmlkZU8wdm54KzYv?=
 =?utf-8?B?OFBISTFDSWlwcjFwdFJudjkvcXJrbVp2d1R1NGVocEFwbEExaDRvMk5lSUoz?=
 =?utf-8?B?aGVXWFRCRHBIb20vbFhqQ2J1Q1JnQU9odHlneWNVWnlyczU4UmtESkt2MEVQ?=
 =?utf-8?B?NzJnRzJRdWNTVHdSZFVXZHAzZGpDL1hlTldnWkxBVlB1MjQvM3NWczllOTF5?=
 =?utf-8?B?UXFwRE56WGhNekNFVUtSNEZFR3ZqSE5pd0NjYlc3ZEFqUXBzeVhheFFUTGwz?=
 =?utf-8?B?NzJHSEdTOElsRFVlaGlaM0FZNFgzc1pwSFJRL1c4Vlc3eFMrdXJ1Ni9hb3Ir?=
 =?utf-8?B?REx3SHpnY1NYMG9iS2JBbFowVUI4NXdMaWFFS1dRVXZSK3p4QzRTczRHVC9n?=
 =?utf-8?B?Yk1Fc0JMcGpxYkNycFV5OStYbTR2RjZjK3FZMEhsZm5KTWwwQ25tS095dUQ0?=
 =?utf-8?B?UkQrUGNSUzlLd3pmOFRJNWRMS1hXSWhBRlY3bTNDZ1VXQlg2NWI0M3QyemNT?=
 =?utf-8?B?MXZRcTRpZlQwUFpHVURrSjc5bzJsTVZpd2lvR2llVGh2SXk4b0hkWWFNbzlG?=
 =?utf-8?B?M2NVTjlXSk1oS3FpRHhBTnFvajVvL0xFOFpiVjRrT2htWTMzRTRZeWFtM2s5?=
 =?utf-8?B?Tk1BMEJLV3ZHY0JTQ2d4OE9PcDFzT1M0d1ptekNYeWR6UmpUNGtyZUZoUmtk?=
 =?utf-8?B?UGNaNjU0anNwQk92UzZXMFZKRFpyUWJxcDE3SElkSVJZMXJlcHpVd0V0ZHMy?=
 =?utf-8?B?OUVaR09wNWpJZEk1QStJYkRyL0RmV083RExVaFJHbWhxczFROXBHNVlRdlg1?=
 =?utf-8?B?WVQyZGJISkRXRlN1NWhIbWY1akxFVWo4WkliMWZVN0RxdVp4dy9KN0wvc2tl?=
 =?utf-8?B?alZ5NThEMWRTVGg5Wkh2ZkVFeFIzV25xUXRPUndReW1JcnNxblVkaUFxSG1I?=
 =?utf-8?B?TGQyc3VZZ2dXL0FUSzdVa0ROZjdKN2lzaHdueVZtU1BpREV0OER1dkw3Tk9M?=
 =?utf-8?B?dEw2dDdOdjdXZWxqQXVDVkhWRWUxNElYcU9yMjI0SzlJb25OTVZ3Sm40Wnhh?=
 =?utf-8?B?ZGc2MFRvSUcwSnYwWEFVR1VRNXlTbkpQdFNLRExoeUg0UmhOa084bUtRQnVl?=
 =?utf-8?B?cmhXOUtVSTJqU2RhRVZsOTNidkI5bmNqcCtCUDNva2hTVmtJcGhiR1Y4Z3VU?=
 =?utf-8?B?a1RGSVlkYVhmVk1KUkRFK1BDOGxtajJsVXJ0K3JuckdNM0k1Tnh4VDlJUzli?=
 =?utf-8?B?YlhqV1lqb2VZSGhYWWErckJuTnBhaldsMDFtVHNzWHZzcno3MmVjTEpSWFNF?=
 =?utf-8?B?VHlEM3ZOb2g5RWdTek5kWlAyUWJRc0xYc0xPUTJjMUNpMHc2WS9PQ2RRTGUx?=
 =?utf-8?B?aWkzMU1YNGxBMDdpOUVBSXdadXMweFgxS1FPUmNra0lpVzNyYWZiUmwxdTdD?=
 =?utf-8?B?U0kyVWluNEsybzk4UFl6MklBUWc5MDRiOXIybXpzM2NGWXVNb2FEbkc3bUM5?=
 =?utf-8?B?QlVLdEl6ZDZlS0JNakhoVW52YnZrVzhPWmUvdkxoZDYxa0hZMnAxWnhIMVY4?=
 =?utf-8?B?Kzl4RlJadzVzT2hRZEpEMFNaQjkzVTdjdEs3bnVlM2NRWkdJVVZ2Z01SbXhI?=
 =?utf-8?B?WHFBTUoxaWFjdFFBd2xhRGw2cnhFZ09nV29BTUZFbHA4c1FZeXZab3VhUEZO?=
 =?utf-8?B?TzNqK3JNdHJGaUtFeVJJY29DY0tLRi9PMzdleW52L0p4cmlkTExqdVJOcTlU?=
 =?utf-8?B?VUZnMUUyVE9YQmU2MjFmUWVpQjhwZEFET010dnpHR3VvM3ArNkdsU3R4VkpY?=
 =?utf-8?B?VnlPRXNKZDJHU0p0VndUZTZ3Q09YbVpiN2RZQWkybENyNHJKa1ErUnJiKy8w?=
 =?utf-8?B?WGxWUHl5dUdhK1ZlTERYOWFJcUhGYTRpYVF5OEZJbzRiU2VlamN1MG9TZktz?=
 =?utf-8?B?eW01QzhkaXJYeVdyRkJmQ2g4NFliWlZ1OEpwbFZFc2RmbjA1K2dJN2hSTWhR?=
 =?utf-8?B?V1AzYTFLZlB5d1hhZGZpeVNPdllEN3ExMExxa3Z4NDlWMzMxN2RUS01kaHhW?=
 =?utf-8?B?WGNoRmJMM3VaRjZVOHBESnRYb3MyNkE3NWdwck4rY1hzeVVZblBQQmptS09H?=
 =?utf-8?B?cFpWSStJNmhXdjBQNkI2RWxtVzNvY1hqUnlkTWJoUG91U1BMVnZybFV0TUpC?=
 =?utf-8?B?L2lzbmpRbDJuLytmRDcxakdtYzl6TXUxQjZGODQ3MERiZTV6NDJsTDUvdWJv?=
 =?utf-8?B?ZU5jeUgyRG9XRndnMmpFbGJQU0NCUGVrV3NCRzRmYjBWTHFiU0h6Tk1lZXdI?=
 =?utf-8?B?TEdrak1Va0xZZG9ORzdBWnBFVkxxbWY5M2tBUHF0WGdIMXNDZWQydz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: de53e094-a89d-46e4-8f27-08de52b76d6f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:21:30.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2zPTxCcNaR2ulN5wr1+pmr5jgs0DYJp5/TVModTHcvzD6cbj0bvbehroq2UTvV9bBVSjE/ewDsGAQQ6zyWg/XqXVbFykK2QZ6jwXyJ10sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:21:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8539

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Poky -> meta-yocto link replacement.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


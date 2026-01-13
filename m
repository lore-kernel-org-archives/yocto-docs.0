Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F034D2F332
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:22:23 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61255.1768317738686645777
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XzfNCdBC;
 spf=pass (domain: cherry.de, ip: 52.101.70.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9wKeny9paErF3AM7JaZ1FfMbFzu66dsYfYBDGh+hYU1CKAbkB/M2GjkwrD57fXdQHe5p1uAdsZvY1lsZS+Kw9SvjbswKwBglzOuDG669I0ZJhNj68rQ1Jap4EmPIRnh3WgSnPhjZp2XCj2ijkv/iAs0s3MOYqUdeMFcNX4uVKTrRTekdWlalaIDwodirY0jUhlL1wThEU7O30ynyLMI2P+L8P3+0zq/M0b0TzONfW8du7/TxjcBD0aQLO2fgOR7DSgxbrUJhYkY3ymAG/nfeCGOj7jNDjYmnlzRvqMK/5FTzlS/Xg1V4FBk7KrC8FCsRWcE8B01fINk016BaDTiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=N/GcqdH6wbwLrIButORHR/CpsfavxwrL9OFirE+KlpZ3wCTyUZYGdh0a1MdQ7cKD+r6vslIga7JqbKqpN1Vrh1OH8tJMiZoT0f5+GJZ7iiYHFP/AsamwwquYF5RcMTaCAbmWqfJUTSJSur0xMzeGCv8p6f3TdXD7mmm/W22xjXxm7z/PLPCCJaPF0FTDBQthUEXMIxwTpCJB1hb+M3LOgUmCNTUcNwZ2bkQsY4IImZxHb/Y+ZZKQeWDQmGppuknK/X/+6bQWyZfvft3RaIXI/Mqv3WoukgygQ+CelyP/AbZ3YlDUBt4Bdbo8y2FJOrY0ir0Ekfh71FY6csjttQW8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=XzfNCdBCF72JP1+AYm7PzvfqgfIRuqLTIzq/6cfUvXYKPzIcLaJMUGPzhD0kEsgNVSWomhhAVr1g+sge+Bo3STNNJIUVXju+rtal6Iz+xU5RUJt/qZvmpSUj9vFCMPEM3hOokPuFxv8gtXAtT8HojueF08BEFw0V7vAf014I0EM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 15:22:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:22:14 +0000
Message-ID: <8c8580ca-9efa-4389-a346-4528a4227faf@cherry.de>
Date: Tue, 13 Jan 2026 16:22:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 51/53] test-manual/reproducible-builds.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-51-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-51-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6291d91b-ab3c-4146-d5e2-08de52b787f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXZJcGx0aWhUWU0yTFFsTHozZklUT0tySmdkUVZhLzFHdUlSM1RtOCtMb2VE?=
 =?utf-8?B?eFJHQzVnd2k3UEFFVHd5UmNmdENDdy91ZERHOTBwNGxPRmp1TWwyeU1VVjk1?=
 =?utf-8?B?YzZsaDhwdmlkOVhXYVBrRkdSanZ5UzAwUnFKMTB3N1M4OFJLdnBHT3c0WC9I?=
 =?utf-8?B?Uys3SU96aytjYzFEaENMclF1cFZKQk43K1d2WUFQOGNyMEU4dGptckNKT016?=
 =?utf-8?B?UnAwTytWTTVnbTNWdmYzWktaS1FvREx2Z3N1emI0WktnZTk2U2VrbGJoSmtl?=
 =?utf-8?B?N3Q5TElIVzVEbFptSHd4b3BESytuejhPdzlsdWF6UzJsZkx3NXBjMTRqcFdZ?=
 =?utf-8?B?VENqZTBEUkVjSGdrZG5WMGpQM1ZuTE42TmthT0VIbktWOXJOV042dC83a2hZ?=
 =?utf-8?B?Ti9LZ0NHVUhvRTRQTkRiYUY1TDM1QnNNdlgzK01qWXpNNytGVndJNTlhY0xx?=
 =?utf-8?B?bGN6VUdLRW93MmNpeGw3aFl4UjBNUnlWVDQrbnRHdUxtTVBuNGs4QXZVZDBM?=
 =?utf-8?B?ZTM0cExPNHV2eTBDR0xHT0xlSlNuV2lBQWtzSlhubDIyTHVJMGhWZFo2M05q?=
 =?utf-8?B?d25WZnJ5VFpBejBJWU1kelBZeHU2aG5WN0hEaFJhTnMxWVJuTzVSUWRrdDBv?=
 =?utf-8?B?RVA2VVgyaHNsTDlnNklzR0dpL1ZDcU1ZYTZWNGRGVE1WeXlWN0tmVnRUVTRj?=
 =?utf-8?B?UEIycStxQkZENDR5NHYzSXZ4QVdYRytKOFhMNmdVSkNCYVUxQ1M5YmVOcThV?=
 =?utf-8?B?SENEbW82aHdTT3dBSGYxY1pYWDBkUmc2U09RUWg0Q2ZRb0d5YVEyTEorbC8w?=
 =?utf-8?B?QkY1RW5rS3lFZjl4UHR5V1gxZS92enhXWlVNdWpxdVFlMUpnTTNWM21OSkpJ?=
 =?utf-8?B?RHZQZ3Mwd1MzTThwRWZxS21nb3NNSG5BRXRwbG56cDlaOW5MSWpEMXBVay9o?=
 =?utf-8?B?akovUzdPYS9JRTlzL090WWFtWEZhbmhqdjhUTzU0b1RERW8xRTh3eUdrc3Zi?=
 =?utf-8?B?aEdIYW9YODZ0a1RIRnJGMU5KcTZUK210WVZNNSs0N1FOQWhEUHNWcUR5T2Iy?=
 =?utf-8?B?M0dnakwwU2xjZVBMdHRMUjdsWXFDMVVHTGZnUzVMTUhRWGp4dmVxOTM2cUFj?=
 =?utf-8?B?R3lwZENsYmlxZ0VmUVR2R2xVWC90eDdXTkxEYWRodkorV3BjZGVYdjdPcEI2?=
 =?utf-8?B?bThoSERvM1FOdWlweXZseVBUaUdwSHBnb1QzUkpzZ3hKUDJnWklBeGVjUFNk?=
 =?utf-8?B?SDQzSkFYWGlkREpXWDJTUXZ6cXgzYkw1L0hlL2VUSklYSlI1RHZyWGZYNjlw?=
 =?utf-8?B?ZFg0VFh2THArS0xaN1IwUTMrcU9mblRkT0lOaitnb1doaHRtakNNZ3FVRjNO?=
 =?utf-8?B?VzArNGkwd3FiQnc3MEdZSjVTQmtzLzIrOHVJS1lNdTNTdWlWOXhqMlkvdkJX?=
 =?utf-8?B?QUFwTGlYWndHMGdRV3F2T3liUW5xV3dZYTFSdlJzQ1lBUkpNaTF0eURoV2pD?=
 =?utf-8?B?cWE5Q1VON0lSSml1L29tZHZBeVMzOHRzZ0s0RDU3aVdKR25ZekdaYkd1eTdU?=
 =?utf-8?B?Q1oxWVJqcnJNU1BpbURCd3pmd2JIZ3J6dDdUOHlJQWtWWi9xRENTeVpVa3Az?=
 =?utf-8?B?bGJham0wL0MwWUpmZzZKTHR3OTYrUmhnTmpKRmxEdHczQkpFQ1RjejFzdHFD?=
 =?utf-8?B?L2l3QUZ6QUZoUG93Uk5mVkxxbUdzTkRsSXBKMXJ2a1FZYTNBUmFTUVh0VEwz?=
 =?utf-8?B?RkZIMVpQcFZ1Mm1FR0NOWkk2MHVzMmFHYjNqOUZUQVpkQVRkNXBHdDRyNXI5?=
 =?utf-8?B?NVcrRnlnNitFMVNSdERpRUNRSFA0RE5heVkrS2gvbUxsOUxNMVR3cDRVeW82?=
 =?utf-8?B?T3U4YkZHL2ZoTytNbEFrbk05TTNiY2pkbHBCWi9XMkgwNVdBYlp5a2J1QTEz?=
 =?utf-8?Q?oIZ52+NDdbOUoPMuj3mS/CmDcMNfJjBM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUEvemNUNStPbHlNM0RSOEVic0d4TXNsTXBnVHVTWVRFa2xUOVZWV1RESFVu?=
 =?utf-8?B?YVRIaE85RjZRbVBYNW5TVXVBOGZwSkprVmFhcEpZZm1sWU1CM1o3Qk5NbnpP?=
 =?utf-8?B?NnVOS3huTkVHL05HaHZqVVVUVk83Y2FxemczMGlRc1orejYyTEdpaEk3WldZ?=
 =?utf-8?B?QTZqTmdQekc1N21Nd1RnNHpzM1Y4d3U4RUorb0pKMjNadG4vVTRHSXZOUmpT?=
 =?utf-8?B?NjllaWRGbmUzNHRKK3ZpamVCYk9lQnhBQ1NuVERsek1xWEtnQkRSc09TREZ1?=
 =?utf-8?B?bGxKTHlOZUYxSzZueEloT2tGMXV4cm1uQ2VkdkNwak54OXdFakVOM3pMOGs3?=
 =?utf-8?B?VEdYSWI5N1RlTG4yMlgvRXZPYjAzWWFoWExzUGZoRXQ1K2JFbk1OQ0FQRkh4?=
 =?utf-8?B?a3h5b3QrVXNBM0x4eWZCMmdJMVh0R0pMRmFnZm9tTGJDQXphYmt6VEo4MjBk?=
 =?utf-8?B?bCtJdmhKa2tLVkpFeU12eHVrZ2FCSjFsemE2OG80MU04UDh6MUxpYmQvVVdY?=
 =?utf-8?B?RkZqRU95Tjg2a3IxczNsbk91MThqNjV5cWEzaVZyWWFNRHhLTDFaUklqMjdx?=
 =?utf-8?B?YmxSQWt2VGZaTEx0V09odXRMY0JkM21Eck5YbGZDSm5kNHpSQlJDQlRtY3ZH?=
 =?utf-8?B?a1E3QWg4ZG4relgvcEdmMllHTk9nWlFqd0RtSmNvb3NGa0VNeXBNM21obi9W?=
 =?utf-8?B?S3FvRTZvTXRsS3RST0NuQ2laUDliMFBSWjh1b21oNGR0b3gxcFhYcTh5M1Na?=
 =?utf-8?B?SGNxcXBKbys5b1pNTExVVTQwcEZqNGk1a2pkTERzNHdXeUgrMmhaSjdpNzAx?=
 =?utf-8?B?THRVbGsrajJsanl3Z2FrdGNmYkVqY0FOUngxUERDR1VsMzJzQks3LzBVWlVs?=
 =?utf-8?B?bmhWUlBUTEQvdzB1LzVtdzdTYWFjSngxT0RwYmFJeUtTUzcyZTFUTllXL2xt?=
 =?utf-8?B?UERVcEl4VmxhUjJIdkNFNXlmeEs4Y3hLNm1aTkdXYVYvNkhTRWFab3VYa3BP?=
 =?utf-8?B?WnlISEVaekpOSjh4TnNVbXdaaG9IcFgwUU9iWldIQnpsL2paUHpUYzNkYjZh?=
 =?utf-8?B?SStFQnZKSkMya3NkV0xOTVhSS3JON1pCVk5IdlNyN1VmbnhLaHJyUUEyZ1RW?=
 =?utf-8?B?ZHgrSHJ1Rk15YXYwV2t4cUFUZFRrUjExVXdGUWVGYTVRM1lGNGEyQkxDdlc2?=
 =?utf-8?B?VmU3REw3N0lybkk0T0FpT2ljNHA0SktpV3RCdFdiZWtXVjJoU1JMbFhNVis1?=
 =?utf-8?B?a3UyOFI1ZTFHaW1DSXduMm05QmpqYkhTcVNqMndiZ1pSRGNSVmQySnBJOERO?=
 =?utf-8?B?eGNPeEtzeVVhTlF6ZkdyYTRhcGIxWnB0VC8yVFBKeFRLdzJibHFsbnJ3Sk9p?=
 =?utf-8?B?SmJna1ZETG1sbnFQUStuZ1pCVTdHUTdQU3dvbThPTkJHZjRpZ0NuK2t3T090?=
 =?utf-8?B?bmdIcUtENGNxVGMxYmtTbHFyYzZKaFh2NW9PRjd1dWVnV1FjWE5QSUoyQlc3?=
 =?utf-8?B?cGhkNndFU1FWL0s5UHdCT0lMekNWcmpIWFlab3JneGc1SHNMZlBoMDRyOFN2?=
 =?utf-8?B?TmxZSmpUS2ErMGsvdllrR0tENFltNXRTSGpLYmV0S0ZiQy8wNklyNlhhRUlm?=
 =?utf-8?B?dWk2amt1dTkxRmZESGFZYnBNYTZRNEtUYVBIakRLdW9BYkI3TEdla3RoNWtR?=
 =?utf-8?B?TmhtOE1xVHl4cENlanFydEdZRk91M1N6TXRvQ1hEanlpVnVBT0xDdC9vT0Yz?=
 =?utf-8?B?OE5TQ3dlTnBpTUdtdkhYeXNRMGI0d21paElvRlBLSEw5MGVEYkJIeVlySUwy?=
 =?utf-8?B?R0Q4UVpXQk11RERtQ25udXdva2JIaTlwMzFYTWl5RWJpZ1NvWDVoU0diaTVK?=
 =?utf-8?B?dkpIQnJ1WFdlV3VJS3VWTHBaYzY0M2lmdEg4T1BWS1ozRFAzSVMrUUxsQkxv?=
 =?utf-8?B?SVFyZlRxYlZaU3JOZzc4QzRtaWo5WGIzd2RvWjRlTjRwUlhEM1BRS0RQMFBU?=
 =?utf-8?B?RFZpWXNKVWJlOU01VkdGOFdMZUdlN2l0MEVEcFVzc3lRTG9EUFN0bHpSaUU0?=
 =?utf-8?B?eW56MXQ0YUNLbEdDR2N0ZW9sWjEzMm5MQk51RkZPNmFOR2pTRlZ6NSs5cG1E?=
 =?utf-8?B?UDFaWVcvaElkVGtSTERLdW5ybmw2L0dxMk82cG9UVGh5TUxsS1BvZEphZ1Ey?=
 =?utf-8?B?RGV5OU4yYW4ra3VNN3haTVZCVnZrSEszbkhRcVVSSWV5aDBDSm9vSUl3UkFa?=
 =?utf-8?B?SUxveEZJd1NTSG81aTBSZXA5eDFJb01DdVFCQk9WMWRXNlJpVkxpanUwVlpM?=
 =?utf-8?B?aXUwaFVWVWo0K1dJUTRTNDdhOW1RQW94YW1vQXJUS3FpOUwySEJadz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6291d91b-ab3c-4146-d5e2-08de52b787f8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:22:14.8253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HK7xTUQ6Sqg7fu7jvmQmxZEzmOWc9+xpwsk0lpYm8R8pbyy2bmYEdSltbzy65ViiUjxyQZKgPiz6ktEFFjFuNK/ZTfjD9FrsmwxlHkhELz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8540

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59932C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 15:44:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web11.20094.1736783065462759882
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 07:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LWkIuq+6;
 spf=pass (domain: cherry.de, ip: 40.107.22.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3Ql7CT5pb/1yjO9tCoK6oOvRE/HJ2OuJPWw6+g7AsbXadAUa6UBydhUGXtR5vXCpNalIoaRTFhQSWEOzK58xUYdQ/R4eiQW3xth9ST39W3pDInud2zOj7AkhHJ7EW5zJIG5RcQxp7dNvQcOHrMATUzZ6Du+dxcD0B2ji73Qdrl0WEko+2qBnxJeRUcAmL1RdMvQWoHdKAQjuq5D5BSiI3J2PWzyYoc09o8fXxDN2RY0e1jOkis33n4jFekOeTH5ShjXODc7FyR+s45FGHVSx0oJ6/lzh7tklxdhnLnZBrtnGpkpUpez1Lvg4b/WBSf4YoVw1QwwXobvAJSz5tu5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eyMWlxm31/2jVaPPQepxlZcBwtPu4WzGikFKmM0jXk=;
 b=rFagRx3BsiSlGIK5MHn5O86z6ypD3fYVPhL4EM//zF/fu7paonZbWjKc4MasZRSDGf+We7ImfLQ0xXa2LWYKTLuBTrUBRtJGYPiJTrHU1QwmnoceIF6DTtdasQDygwKVMLfbdDOzEqsIjA5lawSxTKWuMnhbkdlwZIK0tbvqKbMtB7NZUVn0/vCTis/6PZETpuuK+oXbcYR5Ku3fzjNDMYpiJ0bH4fQ2627qArGz+Tr079qeX+znnjjYqdZVOTGLBh/0i3b3htJR8ivstMozWA01QruXSGT30PclPjbinHYgg27x2qXhv11cY3qTxLU843nQbAyWwfDFxw4vhdIoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eyMWlxm31/2jVaPPQepxlZcBwtPu4WzGikFKmM0jXk=;
 b=LWkIuq+6W5UpiVehrY0U3eCKv3A0IrTnJEEII9n30k/1eQcGmPHK+Ro4s1PYQ2ha5yeWOKAfwbOZMbppD8jPMcVzkq2za4C1zoleqxlBrca6tMneZnEFJawwZM47K4xlPGorQ2Kep3pzyY+P6HS3TsbrgJ5uCBsF9q6PWrr5UCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10354.eurprd04.prod.outlook.com (2603:10a6:150:1e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Mon, 13 Jan
 2025 15:44:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:44:20 +0000
Message-ID: <44404969-f43d-46cd-a2bf-b04a65c3271a@cherry.de>
Date: Mon, 13 Jan 2025 16:44:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] dev-manual/devtool: remove reference to the
 extensible SDK
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com>
 <20241224-devtool-dev-manual-v1-2-0cc4fb584018@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241224-devtool-dev-manual-v1-2-0cc4fb584018@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d962131-18bf-499b-e94b-08dd33e92562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZXRPS0trU2x2YmNtQ3M1eWloYThaT2JWdDFIVnI0TGI5VDROOXdTUXUvVFZT?=
 =?utf-8?B?OFdybWoxT1k5Tk9JQTlMOUd6YnYyVjZZd2dKemd4eGozSlJQMnlYZUZEWWFJ?=
 =?utf-8?B?VHZLVGczcGtMN1VoUzgwM3RkVFRFb0tiY09INm10VHA0aG9kNGNpdHcyTU1s?=
 =?utf-8?B?UmE1Z3dOU28rdzJrekRyRGhVSVVHR0JiVVFGT3NHQUZhNWNTRkk1ZnI2UmhH?=
 =?utf-8?B?Y0VpcWlTRkIyelFUM3ZmYVZBZ0NsVXpxeEtaemYvZzhjUlNDdmpmd3hUK1JF?=
 =?utf-8?B?TGpwcG9sdm5CN3JYclI5RXZhYnBKYmw2ZHo3dHk4eVFucThROU9tWTZGYUVa?=
 =?utf-8?B?SnUzVmx3Ti9SWU1KRVRIQzI4UDBZdkhnZGJhS0pBcTM3Y0xiYy9LOWVWT1JQ?=
 =?utf-8?B?TlAyYjA2OTEzOTh3Q2VmMnNPN3FqQ2hkckJuZVdWaWpJTFh0MkN1dWhadkdr?=
 =?utf-8?B?UjgvZ2M0c1lMODZtSFhhOHZWNE91bmRjc3QvYnVsMy9jRDVnUWppNXBvc2NW?=
 =?utf-8?B?KzBIS2Z3aTZqS0NrYnZVOUhBS0w5U0JKRlRFQjQ2Qy9pNDUxVGV5Q015cGpY?=
 =?utf-8?B?dnZGaXBJT2lVS09yTWJPUTVndEphTEYrbmIzOXlKVXdrbXZMVnpFTEVVWVRu?=
 =?utf-8?B?N1pjN2paR1krVHFyenFXZWpEbmNSWXVHUTFZdlh5SVVON2ttN3Ryb1ZhTVJC?=
 =?utf-8?B?WFFRRFBJOUtvWGFoTnUzb2xPYkRaSUxGaHVQeE5sV0V5ZHM0Ukd0U3BiQVhk?=
 =?utf-8?B?RlgvSlVTYnlLNEtCeUNSRkZTUVA3SkdNWFNlQ2hjUlVJSWZrUDdzb0Zxd1ht?=
 =?utf-8?B?YTFZOEt1OFZPN2ZJTDVZWjJHMlJ5T3paS0J1R0k2RlQ5NkpLa3FJZWFWd0F1?=
 =?utf-8?B?STdzdUE3Y1ZSS1N2WlVjTU9BQzRFYVRrZWcvL1RzNjV3Qmc3c2ZMaHVwbU9W?=
 =?utf-8?B?dEc3Vk1KSCt2ZENUT2ZiZU9tVnI4Zm5iWitMTVA1cEVRRkp3RGNGcWpEVDdF?=
 =?utf-8?B?WmpxSVMxOG5hQlVaMzdBWnZWbnBHNzYwTjlWYmtqVUxiNmd3UEFUUlYrT3hL?=
 =?utf-8?B?K3VVRjV2blBZSVBGUFhRUU1aRVRNOVhnUVZBUVpIemg1SDhVcVI4UjM0NHV0?=
 =?utf-8?B?SWF3YVN4dlVMWDZqaStRajZFTW1rNnE5cFQyNGJodVc5VkJ6bXY3amZBNG9o?=
 =?utf-8?B?WjlPNjZManIxTGJBbTBNaThSTEY0Z2NBOC9vK1g5VXE5VWVJVHVNNzRZVk9P?=
 =?utf-8?B?VTNUWTNYVXNKb2lOR3RLeTZ6TFpmNVR4RktlcEdPMmpUT05DbnJ4UGN4WGR5?=
 =?utf-8?B?WmpueG1YMDIwa2ZkQW1KMmNsK2ZVN3hoRnlxc3NEK09SMlpBWlpJTnhIOG5n?=
 =?utf-8?B?L096UXcrQ2gxS2luVU93bWNPN2lwWnU2WTRKVXdUbTJQMlFhRUZTZUlqOWFY?=
 =?utf-8?B?NkxJSkI3ZG9qcEFUVWdvNkpIV3hKN2FySkRVdUx5Z2NlbWQrb2t4Ty9QdXY0?=
 =?utf-8?B?bmRSeUFLOW9HcUpjeTlDNTNtT0JFaUJ2YTNyYjNKcFRlNEZxYkx2MmhmdFBT?=
 =?utf-8?B?MkpxK3E2M2ltSS9TV0VDOXpJL1A4N3grSjVxMWplVlk0WlVwKzZnUkxtQW1s?=
 =?utf-8?B?d1NUMnZzd3I3UldmaUl6Mk1ka1czU1RDUXFCaDNqQjIrTzAyS0NrbzN3Qnpa?=
 =?utf-8?B?Mkl3SGlPS3R1OVgrSVFsOVF5M0hrc1BPdFpuT3JZRGxiWEQybkpVdEo3MTF5?=
 =?utf-8?B?R3grRFd6TWVWVXhvc1VpR2VoaGdvNkZhdnU4dlMvMzZuSjhCOVRPUlpjbXNP?=
 =?utf-8?B?VlNZZElTM09GVmxLcldMTTFqbk1jWDIrendpOWliSit3c3czdmJwczl3MGRi?=
 =?utf-8?Q?TeWbaCayU+AOD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkNqSU1yTzUyOXFuVGFjVlVBTFFZMVZiYWR4REVTT2Q1Q043T3JGNXdacVNh?=
 =?utf-8?B?RnZmSVRpL292dEg4N3l6elE4Z3REK3pFTmErYnVNMENUNWJDb3YwTEVzZHVs?=
 =?utf-8?B?TlNxR0ZCWEJOWjNDNXBwMWVoYTMwR3N0K0RNZGNWeVZNTUFTUnNGeWoydXhF?=
 =?utf-8?B?L3RDZkpKVFhVUUlDRy9NZkhINVhPMWZub0QzZllRdVczU0NydW1hZWFDYXNZ?=
 =?utf-8?B?dzBvTmVtZEFHcFozdHU2ZnNvVUVQQU5mQW93TjY1cTJsRVVWV1Z6Wm9CbGlW?=
 =?utf-8?B?ZGdDaVN3c0Q4bmUyUHFyQ3R6S25SaDFPU3J3ZUhsSWtGZ3dTVitlRnBxNklq?=
 =?utf-8?B?ODlBMk5BVGk3TWlHUHZlRmVYdEF6QVZaSUNSVUp1Yk9mTVp3YlhnTTkxcmd1?=
 =?utf-8?B?VnAvc2syMXZOdEZNRkUvZEpPTXdXZTg4cTdEZEJwVEVhL1EvWFM2QlBydkZB?=
 =?utf-8?B?NlNJM0Q4a2hQUm5kQ3FTN1JWUExsWXpXY0JMdHpocmVzSitCTUFBN0V2M1d6?=
 =?utf-8?B?R0N6UmE3ck1VaGtHUDJ1Q290eU9nQVBjdDh4U0Vuek85WDVobnNIdXRoTFl4?=
 =?utf-8?B?QW1lQno5YVg4VWlST284NkZBUXBPbHFWMXZ1Q1llREcrMWEreGIzeklrUy9X?=
 =?utf-8?B?ay9WU2R1Q0picmprUWtXZVo5ZmhoNGNWTzNzTWdVU0U3Q3pyV0VtM3plcVR5?=
 =?utf-8?B?MVpUNHdscVpiRmFPVzArMW9VNHVLb2Y1b0YwVVVQS0JtM0RsMG1rRkxrczd0?=
 =?utf-8?B?eXEwdS9lVkY4U1B0SEZiZ2h4V2ZFMms4SHhZTmRUbnZ3aS9DUlA1WUlMZVhQ?=
 =?utf-8?B?cDQ4a0tuUFVhWWNzaUVSTmlPLzN1R1lFSERMVk5velhmYWUrRmhOano1c3FZ?=
 =?utf-8?B?MDFWVzNnU1NLcytvRmdBcGFuNEd3UUF3c2NMYTNrODRrczFFZGZ5cFFhVjdt?=
 =?utf-8?B?MitCdEVHMFZrSzR5NGlnSFdsWVRrMWVxYkczMmdKV0JyczJOU1VsM2tselBW?=
 =?utf-8?B?clZ5aWd4MEx0M0xpcGNFOTZ1M0o2cFdPcjlHaXZHR05meU1wRTZKVk5Na205?=
 =?utf-8?B?RnE1YnZuWmRWZ3U5NkpDK0Jydno0MnJtZHEzRUdmbEJwTklkYmh6SzZkcDJR?=
 =?utf-8?B?TFRTclpIdUx0WDlGV081LzdHeUljZzQ2MjN2a1I4bHBYd2xlcmJwYjUrbDA1?=
 =?utf-8?B?Wk92NUhraDkrT2pTTHRKUlcybTR2RSt4VUhLdjFTdjRNL2o3OHpTMDVIZW8w?=
 =?utf-8?B?SzN3RCtpM1M5L2RmZ3EyZHVIQmxNNnhldHRXdWo0ajdVNzVBWXd1Ymdwc25J?=
 =?utf-8?B?QlVhbE5rdU85SVdlYWgxWlV4V0JlME1tSlJlcFJVZm85SUtuSWNCd1lkTUVU?=
 =?utf-8?B?NDY2bE5lenNoVnMzaGRIbHpGUXc3dHMwdmVDcVBvN1l6NkljTEl5a1JSSlB6?=
 =?utf-8?B?V1IxNUZJR1ZZZFRVNUxlWTVYbERCSWRSN25aeTlEOFRCWXNCc3VReGZ4ckNa?=
 =?utf-8?B?dHkvQ3Nhcm5MUWtNUG9kZmNpWlFUOCtnYXdEZXJKSmhRY3FSRWVUYXkxM2Zi?=
 =?utf-8?B?b1pka0Q5alpkcG1UMWl3VEwxRzlCWEV1czFaUDVwNUc3R1hBcmRSNWFWUW5U?=
 =?utf-8?B?aXVieHFlV2xudUY3SEhIRitGbFhzNlN3RzRrWU1Zc0c4WWJSd0NlczBUVDha?=
 =?utf-8?B?UTRpKzlocHUyRndsWDZFeHEzOUN6cTdmY1JIRkgxSHI2M05zWHNpWERkSWoz?=
 =?utf-8?B?YXI2UWc1Q1JMdU1MNS9xdHdFWGpRTENlRjg4ZHp6TGRDQTFUYi80bnNHMUt1?=
 =?utf-8?B?SSsyVTVMaWMzMmdhQWk4U0RsWUQxV1h4aVVES1g5QTIzYlZTY1ZveG56cmIy?=
 =?utf-8?B?Y09ieXJzT0doa2d1bk5CN0V4cGlhcHM0d1RvRXB5NHpQWEFMeVhXOEtYam5m?=
 =?utf-8?B?QlJ2VzB0ZlVBSmN4Smd3ZlZPMDdDMGo3UWdZQ200aWF2Ylo1UWIrZ2JLL2Vm?=
 =?utf-8?B?NmJTU1I0VWEwVkhqVTNrUUNzQWdkUU84bE0xL3ZKM0ptOHdBWDRkeGFYbnpy?=
 =?utf-8?B?VjVLTDhLRlFiK3hxMTBLdFdlczRkRFBtZzltcnFlU09MSmVCU2Zaa1hCQjlC?=
 =?utf-8?B?N1R0SGREUWpkZnE1VFk5YkVHai9EaTA1NHYzME1jSGdKUi9pWmhPTnNSVHEy?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d962131-18bf-499b-e94b-08dd33e92562
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:44:20.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rm1zKSBzPO+/lG4zBwOtHwCsiU90/KlnZEVEFMnceLTWJhShefvr5J9jB8ZrA6V7GGHhU6umRF9gvmoshq1c9FmrWHAFtZ/gGcuDK1Hw55o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10354
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6084

Hi Antonin,

On 12/24/24 9:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
> There were leftover references to the extensible SDK after moving the
> devtool documentation from the Extensible SDK document to its own
> devtool document.
> 
> This patch follows the bulk move to make it clear what was modified in
> the document.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


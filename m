Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D177C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:36:04 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.62])
 by mx.groups.io with SMTP id smtpd.web09.10584.1647959761110877059
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=olcAQf6G;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.62,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCPdUaNED7Sd7WYUDXCW8fFIkPecnQUidFNmwQM3BzqkXQ3xSyny1lKlS2dSIX5zRz4kfTyAd1gwK47U1d/mtNNDK7BWlmkfk63kM8Mpi+Un7NyoOvEp6lnDwsk/B6Ix/1DylwOtrzpR0ZD7Pntk/XCsy3tQFuwHLGwUr91hUd+c6iw+XIO7qe5sl6nOAGnOan1fBBIKYtqmEbxRcg9isTKmJC8ONTpN0ScKakz/nVJodlrPzQLZFxKNN5jH1R89Ly5b0jt9X3IBoUHkWpZDO7UwV/sIB7W+SFnSuPXyMzEn3wuZgwK0QPBvrcF3ZPPIV3u6CXMiHmNRS/I1i7j8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWuj55bQH+wKvVBbIOHHYtKM70FFiDKg/dlbqTs8tjM=;
 b=OfYHbZ5vFLLa3PLfRMA3+4ZgwNSORd0ebw8ZbBhfuryEYsNHglrJ8INbfnI/rXTOdmtkcb7ba55snyr4BOZmO5kQBymEYmUiskxqdzAQRcqw9wCj1E+ud+EQRs8xPnUs07XuMGSGDWMlPWzb9p7V4gspkZ/AjoJFuzvr7DI27YoQ40DkoM6/6Q+BSFL6P/3I5QEhXqOZFzDolqYSl2DMRKLGkGtHbvcPRzoqxxC8fd/BxJgIyg8HI7oBeCVOdpix7Rit/FTnL4LXXZD35dA2vMCoLYkoehk6z/gQ4Om78+a8qjP2deefrqMzRYWLooA3duz3Qqz0jqpF76ae+ZFHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWuj55bQH+wKvVBbIOHHYtKM70FFiDKg/dlbqTs8tjM=;
 b=olcAQf6GtDZKBq+qy5XGFRjIaHW7PqQoUxfOQMzuR3XniovbeVaTWxydhWNG7SgW8k02bY06s7xvZS4oWPIffq0CILRF41MhNlUbn4oAs9m5jijFOS3QshBQV+hEEoLyJsDGy/OpV1roVRIUzJdZ1j5YoiX+wT2ChT9ZgBne4KM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM5PR04MB3090.eurprd04.prod.outlook.com (2603:10a6:206:4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 14:35:57 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 14:35:57 +0000
Message-ID: <f25caea4-29da-e9ed-f941-68615d737f3e@theobroma-systems.com>
Date: Tue, 22 Mar 2022 15:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] [honister] docs: fix hardcoded link warning
 messages
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20220322142502.550191-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220322142502.550191-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0023.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::12) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 018a5711-b60e-4b81-bb9d-08da0c11474f
X-MS-TrafficTypeDiagnostic: AM5PR04MB3090:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR04MB30900FE1F6FD8B9FCE078939C2179@AM5PR04MB3090.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vxw/Xzqbng5+d0xqbmJDJbs2OZON652CwY6uWcNtSqcOx03/pF0EzjlMGvVt23sDxZUF0Y9YC9co2Cv5bMWgYRUu7WCQrTg7BtaORhoDB2K7CgeEKiB0N0J8/V10unV8C3dk11rms+1jMFOzo7FseJf/tIp6gYyHuNbmemgAMizPr8kC7Cl1WOrCm/B2dvZwVI/0KWSzARWmzq6KYcmrCYXhGNykTcFz2FJu1AII4T4Ts+34h14xnt38dPIkRa0RcyQTGjFG6Waql+w6h5IQ7ZWreLQ256Y4GG3jA38M2ZCe8U2ZDmYupSj+ZKXQqZM7eaN/bs+FqROhG6WFZI8CFfWdkfhIWiMWceLR+niZUpeo1jNYJd62NVSMYZuuv1qiIAniEsdTEgopN4XV7XKXeqrfagmGPd/P9Ob56M2HLaR5jteDnfYw6/N3/oHp7nKQeiZsmevbYSkSm1aDRt7TvZgOPssclL3egm05TblJ+2YoTXoF4vVSHvAdFeCjGAH075T8VTIH6KisOBaL+4ptf52e3CevHF9t+EmUFCdehqdQh5CyR9S5V24267M/jb6y54bM284T2dN49LshePY09pIGQEu7C4Ys71HT4T+gc4lTQ0WDwKftkcqV3KAIHZElfCKKRmZQG1aLkmOKbfIR+OYSVEeKokcvYkDWTBKdTnjxjGszTlZodkE7oXy9n3z0FE2uaEx4USFSlZhuvo6JF3Oqd9jf7kshod+tiKA0s9DZtFUTtG0G6PEIs1YCMdC2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(86362001)(31696002)(15650500001)(2906002)(8936002)(4744005)(44832011)(316002)(5660300002)(26005)(6486002)(2616005)(508600001)(53546011)(6512007)(6506007)(31686004)(4326008)(66946007)(66556008)(66476007)(8676002)(83380400001)(36756003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFhJOWxVa3F2YTNOR1hXUWdEM1IzSzU1ZFpubDFscERiNlAzS3ZsLzZwVFd4?=
 =?utf-8?B?QmVHZENTY2c2Qmk3ZGluU0s3M1gzZ2NrbWhvSWpiLzhXN1J1L0hTaWdEK21I?=
 =?utf-8?B?NHJ6bGtkRFNUNWNzZFV2YkRBMkg5Qndlc2F1R3V3RnBCbXdiN3BVZFR5aUV2?=
 =?utf-8?B?Um9YMGF2MXpFT2dRMmdOZ0dJU3F6UUF1MFZUVDJFekRSSGJoQ2k0YkRUdlpq?=
 =?utf-8?B?UWxmU2gyQTErd0ZZN252ajI1bEhOUHhSMXhjK2ZWZE9ub01WbkN4QTVqWTN6?=
 =?utf-8?B?enhjYUVaT2U5b1RwYXQ0QUkwcXVrSGkvWVVrbHVNUUI1RkY2VS9XMmw3Nmxl?=
 =?utf-8?B?alM1SlVZNmxXNmpwUnZoMEoxc0hoR1dGL28zL0lsZ1htZjBwTVdlby9Qa3pN?=
 =?utf-8?B?UUFoWDJZTlEwdzVsTWlEemJCNWxieVgvendlbk5nTVpWV2V5eFBtdGFXVS95?=
 =?utf-8?B?ZGVCSmxRVjZISk5EamxzK3RsbWJNQ2IvUVF0Um92S2lJSVdzb1FqaWJiWVNq?=
 =?utf-8?B?bU05L2wzMnFkckNSY3hwMXZINnF2QnpURWgvQXoxRnhRMDdDREs1M3Y3UEFT?=
 =?utf-8?B?b1RnbnQwN3RWdnF4ajhQd2Q3aDRXYXlIR2NIU05HS05ZbWl3eUxnQnVOOEI3?=
 =?utf-8?B?K0VOaS96NEtXWG82dUtEWCs3STZJWVZCZVljVFpLdXl4UHE1SldLckhwSnpO?=
 =?utf-8?B?SjFXTDNHZUJrOTJwTy9iNUNpbFJkM200bndoTmdHVG05TGNLUUdqVjVxRnVr?=
 =?utf-8?B?N2VGVG40c2JFdjhyNmk3bFY3ajZVcGxZRGpjSHI5bUFic0hySjFDNEpmN09u?=
 =?utf-8?B?THp4YlNzU2JYbHVnQ1VpK3NKQ2pyV2JwUnd3UG1PNmdkTEdOd3ZhZmhKNFE4?=
 =?utf-8?B?R1RXYUpBdWx4bzd3bCtKNHBDaHdlTGdUUld3STRCZmVWSDVnL2hoQmhzanFl?=
 =?utf-8?B?N2ZHTTAyT1ZSNk1UeE9qeFpJb2tJbkFQTGVOZ01yelBmcDk5RFJabmd1OTcw?=
 =?utf-8?B?K05ZUW5PODZPZnNyYUJkeFRBZVJKdGpzbE1oZkV2UjNYZk5oNDhEcnBWT3pX?=
 =?utf-8?B?c3dlMEUvTVMxNnpvZ1pRaklDOExFSkhpT09OMC9GZFc1R2E0enZPZXJOWVFq?=
 =?utf-8?B?TTdURG95YkVXSUV4dHBYSXpMMmJWdHRZOTM1b0cxT0hSQ0Z2eUwrRnRuQkdZ?=
 =?utf-8?B?bSt1NjE3NEtIUWl5YXorcGl4NkpWYkU4eU9tT3VCcGJGRWhuQklZRlNneDRW?=
 =?utf-8?B?ZWplMUFVRDNYUFcyeXpNNUYvK2FTZ2dKdWdvSlhoNHpZeHl5RnI0cHdhVG9v?=
 =?utf-8?B?VVNFMzFIcWVhRm84bEladmhCTDBDY3hHUVlvMHl6M2NOdU1ubmZmTzJUTHFM?=
 =?utf-8?B?UHBMNzFhb2VtZ2JSUGFoa0NuSXluYkdRUlZoUGFreG9SWnVPMVdQejljZmZH?=
 =?utf-8?B?ZEQzQkRyVC9ZdUFTRXpieGVWTTdvKy9TdDZYbWI5alhDVGtiRVFCVURUZVJ0?=
 =?utf-8?B?TUNNdG1IdHdlUGdxYVJTQStIYU91MThzYnkwa3VtM1lnRmkvUURWS21YY0xk?=
 =?utf-8?B?bHBNNm00Y3hKWnhFemMyMklCbXE3RzMxY3g3bGdSYTdQak01ODdtdDV1MHNJ?=
 =?utf-8?B?SmRlQXNlWjNhVVdrMGJIK0Z4ZzFpb0x2Ym96Mk9VdlQxZDduQkVoanZSMHRH?=
 =?utf-8?B?TzBjaWdlT1pqOEhad2NhS1lNbjZWcGFBQ0t4YjR1SGRIK1Jma2NiWkRIemIx?=
 =?utf-8?B?dTBPaGhJQXR4V0ttUG1LRzBlcTVQZFZVVVNRa0c0VkVKNVRQNWJ2a3NvVUtO?=
 =?utf-8?B?Qmh3N2RJUWRRU1B6VXQwRm9tSkJaem4zZ0F3VTNkZ2s2SnVieGI0WGd2N0ox?=
 =?utf-8?B?d3hlNU9SVllzekIyTS9DTEE1OW9ESDN2R1BBcXFoTkFsUGpOSkJxQ1kxcEd3?=
 =?utf-8?B?RVRCWXVVVzQ0UTB6NUF6ejJkbWZoaktWcklXK0xOV1BzL3Q0dEVOdW84d3FP?=
 =?utf-8?B?c0JNaXorQW9uTmtRNjVsQUE4QmZwSHVZdUhJZW5IMWZER2VFMzlrUW9CalFo?=
 =?utf-8?Q?X7nMsP?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 018a5711-b60e-4b81-bb9d-08da0c11474f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 14:35:57.8449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kNe76Ds/XWxfQQIAW1bLRpzQYjUDia/BiWlQibKq5I+5QvMPWQfVMTPJ6dTq277BOVwe91vCKDu+2QuYLZbzb2KvptPsttXktV9kr+3AlXT4GeHA7wk06xxn0CHV9reP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3090
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2684

Hi Michael,

On 3/22/22 15:25, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Sphinx complains about hardcoded links which can be replaced by an
> extlink.
> 
> So let's apply its recommendations.
> 

If Sphinx is now happy,. I'm happy :)

BTW, you might want to send patches for honister tags to 
yocto-autobuilder-helper too otherwise we'll have build failures once we 
update sphinx package in the doc toolchain.

Thanks!
Quentin


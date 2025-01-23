Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE643C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:52:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.66])
 by mx.groups.io with SMTP id smtpd.web11.14025.1737647522834641931
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ikiL4c8b;
 spf=pass (domain: cherry.de, ip: 52.101.67.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJchDIFaohJjTQprhbZqhI+68u8Fooh/yfV+ybL34m9ZzSAJfBxmeGMPnYZwtoY3cVbAK6blEmN6xrjNmH59JVPWg+6JH501Sr9lBKoa+Dr5FguYnmyClPt5DTfTn29SWDE4GGa7/G87KIkbCJvcNdpEuM5K/DBcIn116OWxvZRHpXF6HNNdlYLQc/YmPEHxglSIYr7z7wNFxtY9t1Vw2st74l039HpgU9AgshWh4pu6JCZ2WxCzfl/O+rWrYb3VIWesvFdnH/PswCvV0weFsd28GpLeKbwdvLO5j6CimmoUHaRD7gBA/czcqN6TiWPVqzHPO4ocPcxAWN2gfieKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HboKbsetyLk4bgeJVbUL+FemPBiGO9iv3QvQKoj71Ns=;
 b=kS2zoneN0sal9KKZtXlGEyB5SRkXyFSnkaAQwapeb3jvzppqLhLbjH7jsydOpJ5fELb5S8ipBiNw8eW3uAZZqa9mAiBXupSd7iMhnn8eJJM1D18KydMfuAsFRiM3zqlfLqshlIL5eKALWuQKHleTCDO46kzRtdn3IXcRYFhYnerVZ9h7AsDwuVtVzUKjTM84KMjSc18USQdv/76zdc/xN2KW59OB3J8QHLUPTO7GUAdOw6t6EcLYndsnW9DWZ65/ynm+E5R3WsGIHrubyd91rxgfefAZ2Fwqil3uJnzbJieZWCo+RjQlsgZPazs0pDRRIjXk7Py+qlCVSFnT1HvNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HboKbsetyLk4bgeJVbUL+FemPBiGO9iv3QvQKoj71Ns=;
 b=ikiL4c8bd6yLbZcFgS0jaZvI2BPVpkKxe3g/4k5QU1QNZo6Wyv3I9iWgQN4q+sbvcS4awnucPyf67c3jRTUnau1YwMKJP2q3Lsf0KOOekXApJZ9/dCESBdbUeL+sJNQaC0pyKskNvXIBVtHVeeXRU50qLibcUXRJyuDsiS+OeT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI0PR04MB10904.eurprd04.prod.outlook.com (2603:10a6:800:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 15:51:58 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 15:51:58 +0000
Message-ID: <cfe5a9bc-76fb-4719-b9b0-907eb337fc52@cherry.de>
Date: Thu, 23 Jan 2025 16:51:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] add basic b4 config file
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20250123-b4-support-v1-1-03b4a18edfdf@cherry.de>
 <D79K8MV03N7R.30YY4NU4X55R2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D79K8MV03N7R.30YY4NU4X55R2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI0PR04MB10904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc3951d-ec19-4b52-a84b-08dd3bc5de63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tzh4N3dyZGRYZnlrNzhTUlBLaE9CWTVreTZFeE82TTdmYml4ZndtUTZTL0Z0?=
 =?utf-8?B?aDJnK0tOKzdrZTRIVUowbTU1TDJFcmZXZk05bktHMjBUMWY1Zm9aQkE3WU05?=
 =?utf-8?B?TktXNkozQWNRYTBCZGxCNU9Xc3NqOFNhRlBaNmk4akNiTS9jWmliY0g2aXh3?=
 =?utf-8?B?WHVhdERSSEFLS3lmS2x0b0lKKytoUWcydk9hSnk2eXVDRXcwdEVaTmJRM0E4?=
 =?utf-8?B?VWFoeEQ0Zy92dUp0T2pIOFNNU05WUTRWRDBlRmoyUTgrZFkrODBYbmh2UnVN?=
 =?utf-8?B?aisxK2haa0d4OUR2c3p4ZHFGV0tpUzJvTW1TN050SlNScUszY0RyOExYNXBM?=
 =?utf-8?B?Tyt2SVI4YjI4VmhUNFFvSlprek5WNld2WFRBY0F5RHdHV1BkQ3lHUkdEbWNl?=
 =?utf-8?B?bnVNYk1PMmtCVG1VZ3hUMHNEamRkSjVQenFOUThmMk42SWg0RHZES0sxYUlm?=
 =?utf-8?B?MlUyNUEySDJBcWNZOU5tVEJaSDlvR1ZSV04xODU3SUROcEg0K1Q2WEdKZzRQ?=
 =?utf-8?B?UEU2KzZSWHU1MUJnS0ZQT1paMmtKYTN2ZEdMek1kUVNQT2U2U0JMWkhWRXRP?=
 =?utf-8?B?eHFUdUlvVWtjMkRORlZTUEZ5U3pxbWFYb01LSlJkV01hUk1JMnNaQTZLa2Fr?=
 =?utf-8?B?eDlYSWdwR2tnVTVTTWRyZk1adHo5OTZINzd2MDZ3MlpqZVp6WU94QzBJdWhX?=
 =?utf-8?B?KzJYdVRtb0pBYXE2VVJrMnpka09nT3BFSG52Mmgza0tFYkxaWnNZcUFRVkh4?=
 =?utf-8?B?SEUwZllmbDFTOXJhbCtkSUJnckh0SHd5QlZ4eHBEYWo5bXgxYzdYdUpGVEY1?=
 =?utf-8?B?UXZEU1krTkhxRG5ZU0dobCtDanM3L1FvK05oSllST3VFZnRlLytiamlsbFhp?=
 =?utf-8?B?QWM1MkdQT0FEdU5IUnBjK1JjVjh6V0R0Qi9tN2QxeEw2TWhydE93Y1N1eW15?=
 =?utf-8?B?ZnV2SVNxRXVSampFQ05TTk9xSG54d2xnSTdjSkxHam9jYmhvbndRM2M0SStT?=
 =?utf-8?B?KytiRmcwL05TZEtZa0FjUFV2QVdwbVkvTEJiUUlYWUdKdFU0czFpYWZKVk1T?=
 =?utf-8?B?azRSQnk5TmlXdTRzYVRqSm1qNUxsR3VhV3dkQ3E4c2kwMTZpNDVjZlRFZHd1?=
 =?utf-8?B?WVFSRGF0SWxRL3ZLWEFZaGszQWRJK1A2UFBQbDdFbGNuODZ1K3dLU3JTd0tV?=
 =?utf-8?B?WEh6NDJYVTBXSWVwVkgzc2RYYzh0SEc5aGthU2pyNzdGdWlzOWIrdnRHZmJB?=
 =?utf-8?B?eVVnb0Y3ZVNVczU4Yno0Y3k5Vlc4d1o3cFFjQnNEMmpVbmNDMURQSjhkUVR1?=
 =?utf-8?B?d24vcktDWkVsQTNoaE1PNnB5K0wyRlZJMDVobm9IZDk0Si9rV2dOUkZkd0Z3?=
 =?utf-8?B?YzFuNmdXQlhyRW5XS2R4NUZRUGRqQmhtZzJqRk9ZK2o5RFl6S3hMeVZ3d0xo?=
 =?utf-8?B?SElKcGQ4aE4wMHc0U2FFMFJPUmQ3VFRMWDZPUXNJdnFld3NQSWVua1JFY0M5?=
 =?utf-8?B?dWxyTHBYN1lwbkRFV2tYVGpiMEZPNW0rdVZmOHZrUmFHcmdrSHl1QklWZit4?=
 =?utf-8?B?ZzZqaHQ1aGEvNU02RTEyR1orUDJ1UGFybG9xMjFPS2VCV2FDK1NJaFZ2T0pp?=
 =?utf-8?B?WUlLZTYxaDN5MG8vd0ljRG5MeG5TMW9pOEtidXV1WUFZcHpWdkcwS0xCMyt1?=
 =?utf-8?B?QkZLVjhTcGo0TVZydEpyN1UvNWxHOVlRb25ZQW92c2kraUp1cGY3T0VvVWdM?=
 =?utf-8?B?aU1LbXdjRi8wRHFOd1Zrd3RaZUJvZzYrUHR2MHlISWtXYWE0aFRhU2tVdDZw?=
 =?utf-8?B?V256NEszL0E3WXVXenNxdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZEg5STU5M09MaUJDVks0OHZKMUhmYmFRL05CS2xNUzAvekZhYnA3NlVkWStm?=
 =?utf-8?B?UFNKMUVYSWJuM3lqcHFURHV5cDkxSWNUUGROWTRPeCtnUXpXUHJKMDBGNm5t?=
 =?utf-8?B?K1FINGg3TDJiY2lWc0VLZFdoMWs2SkJKL3NhSkExdG5hNTJFNzh3WVI0Vlo1?=
 =?utf-8?B?TUdueHpaeDk2YnhCaXl4MTJ2QVV2SXJ6QVFMRWczdkswVmh0VndSdkk3K2hI?=
 =?utf-8?B?aURiU2ZVNnFOcUdBTzNCUmJ4VHByRDN4aXR5cXp3cGxLejlxTnhXaVVsTS9S?=
 =?utf-8?B?UnN1VHorZ0hVSUphQVpMSzQ0L1k3VHh1bDFNL2pFY0YrNnpkK1BWNGsxMGYz?=
 =?utf-8?B?d28vOWRxTTJVeldrVHQ1MWVaOG5uNVlRNmFybFU1eVJzc1hZY3NwRFlva3ly?=
 =?utf-8?B?ZkViSHJHb2M1dHRYYm52dWExUFpkLzdNR2NlV2dYVHhWNTJXMXlLejJzN1ph?=
 =?utf-8?B?ZU5mWkFsUlRDQW9zTGJIZnFmR0RXd2xuU0xDd1hxd2ovSGhpZ3VxeEdjcWVm?=
 =?utf-8?B?ZUtOelBWb08xbXVuODhiVFliWHN2Mi82aUQ3STBiTmQ2R3lVNE04WVdQZDJX?=
 =?utf-8?B?QjNMeEpyc2wvOEltMXl6YVJWQTFaV2Fpbm55d3BTNEFWZ3ZlR2RPVjJwdGJW?=
 =?utf-8?B?QWZLWWRvRlRjZktZT0JGNGJydFUwcGdqeFhlbFRwWnU1TzNLcjEzYms3VEcx?=
 =?utf-8?B?WkQyZjMvdHk4UGhFcHBKbnZRUmJxRjBZMmJMZDZWdDRtSTVyYkVUQ0U1Rklk?=
 =?utf-8?B?VUxJb0RVNWE1MWF0cW1yVWw5eTUrUkUzcmJPcVhmNkFsTEx5WUNOWlVmenZZ?=
 =?utf-8?B?SExDYUM1cTE3RmdXNURJQTVDN2RLRHRESVZvVFlBS2FRUmFjam44Ull4cHBV?=
 =?utf-8?B?ait1OFJJYzk5K2Q3czhabzhnMGEvcjMwYlFIOG1UaHJndzhJL1VIaTBWLzZK?=
 =?utf-8?B?WExoRVR6NTVMYjU0NDNDNzRoK1l5bTZYVEt4TXlNODIvQTRDUk44WDJxcDN2?=
 =?utf-8?B?ZVNqdENoTkowSTRHWWhoWE1hRytpR1hIZmRxUVBaZThkZmowcjhLUktLOUFr?=
 =?utf-8?B?QkRyakJWcnRDdmJiazl6Sm1rQWZOZ010VWFVUzBRT0xiTFVOdGhrWmQ5TjVq?=
 =?utf-8?B?RVI2aEtJRTlrYlNGNHpRenNaSFJ0T3dTSWRTYkNIYlFVMDFUWEo3R1F1cVdC?=
 =?utf-8?B?VmVpRy9Lanlza3hldjR6czQvQksvQlh3ZHpRbjE4NVZBSUd4NUMwZ2hqd2xW?=
 =?utf-8?B?ZVYzWkFrWXd1ejdBWTZGUU1uYitGdDkwQUp2N2RZRXN5VFUrZG1rNHgzR2xa?=
 =?utf-8?B?YXVjZllTVXowQThseWxNMzdOUVFRbjQvS0J3a2Ryc0I5UkVtcGhLT2dRcnhM?=
 =?utf-8?B?YjhwdEpuR1ArZHd1UmdEZVNneDdXeUNGRmd5cnlRWlEvT25iai9iTnNUQUkz?=
 =?utf-8?B?MzRBSDlpdnRwZTNFMEpJL3BXNytGVFV2c1YwbUtsQVpXWmM1YkVaSWphZWNy?=
 =?utf-8?B?cEo4amNjeVFnUUZJdkEyMmxNVFlOWDhQY1pRYnVTZ0I4VWM4WUptNXp3a2FX?=
 =?utf-8?B?NnFYQzIzWW1XaWtndUVITGhaM0ZMTjFydktWeVZYdDVPNnc0anVGNGRkOHhF?=
 =?utf-8?B?YzdnR1NmU3k1MjNyQ1FnYmVTRlM4NithWFRaeExtaitYSVhleG05aDlzaU0y?=
 =?utf-8?B?K2JOOGdRMVU5RHlzV0tYaWVzS2JWbmRJMXBsWFZlY2krT3VFcWJweTRoVFVz?=
 =?utf-8?B?dFhRRThkcmhLcVJKVjIrcC9ybTNCQngvNWczb3F0ajJRL0trV3NsZWw2QTJM?=
 =?utf-8?B?enlSdThmK3dibDFiYkx2YUg2Vk9NS1E5ejAwZ0JUVG5YaFN6YmJneHlMUDRJ?=
 =?utf-8?B?ckttWkQxUTI3dFRUMUp4KzhBcUgxWWY3T3VFTVljQ0w5WC9XYzFkb0pLREkv?=
 =?utf-8?B?bWlEcWNJRXplSktHWUl1SSs2dUtUeGNUNmRpQkwxTk9EZTJkRkNJd0RRVUJx?=
 =?utf-8?B?bk5iNTNUWnVtNzV4cFFxR2J1YjhQMzJQRENIVUlyb1IzME9sYmpCWXhpK05P?=
 =?utf-8?B?bm42Z0NpTUJ3U1k5LzR5WWEvak5nNXozMklpNmZ5UllnWjB0K0pQRWRkckF5?=
 =?utf-8?B?L0lNT3d3YVhMSXdRaGJiY0VscWJjck5mSTJ0aVArMEhYVlFyaDdEamxNZ01x?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc3951d-ec19-4b52-a84b-08dd3bc5de63
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:51:58.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMguhZWf9CyJF+2btcT6I4kO1a/XO7+jT2N3MyD1BS6+D+Ui5418P5pMKTz7N/6q62Ouq+IgMESBSzNzJF+H4nMECXX8WYNOCDXMmYxPey8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10904
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6165

Hi Antonin,

On 1/23/25 4:33 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Thu Jan 23, 2025 at 3:31 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> b4[1] is a very nice tool for mail-based contribution. A config[2] file
>> exists to set up a few defaults. We can use it to set the Cc recipients
>> to always add, in our case the mailing list.
>>
>> Because we do not have anything to check for now, disable needs-checking
>> so patches can be sent without running b4 prep --check.
>>
>> Because we do not have any auto-to-cc support (and the implicit one
>> using scripts/get_maintainer.pl cannot work for us), also disable
>> needs-auto-to-cc so patches can be sent without running b4 prep
>> --auto-to-cc.
>>
>> [1] https://pypi.org/project/b4/
>> [2] https://b4.docs.kernel.org/en/latest/config.html
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> I'm wondering if we couldn't add some per-patch check as well, checking
>> that the documentation builds for each for example. Could be added in a
>> later patch though. Any idea?
> 
> I would agree but a docs build already takes a while, so I think a single docs
> build for the b4-managed branch would be enough. Don't know if that's possible
> though.
> 

We could run linters or something like that. Anyway, can be added later 
on if we find it can be helpful to mitigate some issues :)

>> ---
>>   .b4-config | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/.b4-config b/.b4-config
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4f87f61b58519862da44fd9af6e6d0018edc7dc2
>> --- /dev/null
>> +++ b/.b4-config
>> @@ -0,0 +1,3 @@
>> +[b4]
>> +  send-series-cc = docs@lists.yoctoproject.org
> 
> Why not send-series-to?
> This is what we instruct users to do in the readme, and in the contributor
> guide.
> 

Because the author of this patch hasn't read the README in a while and 
most often uses Cc: instead of To:.

I think the same thing can be said for my OE-Core and BitBake patches. 
At least it seems to be consistent on which one to use between Cc: and 
To: :)

I'll wait a bit for reviews on other patches, specifically 
https://lore.kernel.org/poky/20250123-b4-support-v1-1-4841f52eccbb@cherry.de/ 
and will send a newer version that changes them to To:.

I see now that the BitBake doc patches need to be Cc for 
docs@lists.yp.org and To: for bitbake-devel@oe.org... Those are handled 
by different b4 calls, so I would need to handle those differently, 
maybe I can have a To: for both :) ? What do you think?

Cheers,
Quentin


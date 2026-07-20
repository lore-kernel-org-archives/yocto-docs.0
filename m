Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FB6C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:33:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.271.1784561601774523083
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 08:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RgStTL41;
 spf=pass (domain: cherry.de, ip: 40.107.130.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl8RrDZ59iXsebFuBg7dYB2j7putPIxq+Re9R1KbauSa9eUpLQ/B/ECh483Q86JLc+Q0/i7ynfU9Mou57n79yHy/c7xuP0rhVgjbvy0265YPV7sNxBqU6niwAMAEYYJLisJlEw+ePmDC58okykVLfloqlWBc+mYcwbS5DMITAYXfQHXthmGiSHSziOB6kqxxqHEo5ny90e4GPmbU9t8nBJ8HYreo4rcMF4zs+fiHM5FZz8sXw/ICNIGUZTAYqzlxDKwef/7xz1Zm7fSqWv4LiH+0ejd3Tc2/SWvM17O2VLJcEIFCvLbjSqzX9jcQ/JpfqiaXMxl7kiUoK8v4tK05wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IOe+T5R97ZWOKnqUZplOu6GPkZJZTY1A/nPsfWlkxY=;
 b=QYRqDJ1P4v0Y1yls5id/6ltQDzDAL3NCrjqsXqpdHhW2l6ao28YCFeQQSUnSUGJ5guaxbVcPK049qMQIru8H9JEev3hRA8TGcMmRxGm0d18zQjBTtSfNIpfwyQTFifRfAhaFa4zuU3DQgpzIk3yO7ooS2lm9Lv3Uq9KmxGNr56bjf+K3pEEvTxvbjDRcmRtYvLKfCYcbcbXQFeCc6c5nyDeJk/0y4j8UmPG+0/8pROd3XKqxvivYYXJLYtBEqkrAFWFU4eYOxRbsDLMDu2QyvElUwUzLv4oTM3pkr/FYZQPkC3/PBpDetDtQDGoTAr1ao4c33un2joKtzI+tws6cvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IOe+T5R97ZWOKnqUZplOu6GPkZJZTY1A/nPsfWlkxY=;
 b=RgStTL41DQZyPoJY1z6eR0RazH3vd/OPb39hN8r+5xMSxNiAeArTfO4ycToxa66vbbN7eaM0cRKkPGqklrwmcYSzPnlrCKtR1KqHQqS9ncAYVyA0Agi9M4f7lbriOXWUATLfg71c25fYnagG9eDLcwBiZLIR5NzT5opxSA+3YIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:33:13 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:33:12 +0000
Message-ID: <e6dafcb9-2ea4-4e58-a302-13a5522962c6@cherry.de>
Date: Mon, 20 Jul 2026 17:33:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] seems like KERNEL_DEPLOYSUBDIR should be in the variable
 glossary
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <f2c698db-6a2b-1004-5819-8030db985d08@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f2c698db-6a2b-1004-5819-8030db985d08@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::26) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf7e772-fc3d-40d5-5292-08dee67435dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	n3v/iW4Of2mVJREZ3oSlgelYrrXoEts8D8iAbDf9Y4KwMKuWnVp3IMVrmQ+RN0ueAn1UAjieGT3BnSIZDIFb0ZW/KLG4BKps3BX+VGYqQTjMPrZVFLyjHCkFDwH848yex2zSPhR7m+XkLoJkRxGtP2R3oSIFrkR3bgxtJc22j0hsT++24L5dnVwTr4vrVHcZMDGoZksQ50HCNy0HdZxHQbwLjB7oX9OGQwEUkuBLFMfEIg0q0Yys1dBy9IHZi1l4BJ4NnnVLWPb3Qt3hHLbnw/vL3k7OUowxTa5ibhdUh5q/AmW2IIUIJckKFFeopZWGaxzbmPEoefzDx/QclLwYwq+OmYOkLOpTrXocteuuG3acZvBmL1SX3S4mbooKSlkCmdzE5bA1EtHKpZXgxMjKWZ6Wc1V6xH4pXaxhK+GjZVoGSOqxjn2wlf+VMdF+5xNha4JydknIQUn4fgz1tNgxD/yz8BZi82/j9IFF2T2Zr5PlXK7UN8O9ceX1+xZaDX2izMd3qKAWOo0CJsVzxgxXt3HgmaEXlGCoIqNMDw1UxJgP8jhBLoww5xnQsjbn8utPm72BW5nZak/C9g4zu0uIeQiIHjX+qVZcRVaPFssL5FvYhPcFub2JfubF1cTjl83mCINgtaky/LNAxVErGFjNQkQAKQCjOP2h+bpvuy7e4Xg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SWszN2NMbWJreVRoY1lGR0p2bERJcjdrZDRaTEwrUWZha1RRbHd4Yjg2b2JL?=
 =?utf-8?B?TWozeVZuVHN0N05DZjM5MWZvMXNqWmNQa1dBVEVyN1dUdm1FZTJYdHZNeExT?=
 =?utf-8?B?c3UxeHFyMEcrTG9KK0c5WUN5R2pzM3VIanZXY2pQRG1IWFVMcXk4ekxXZk1M?=
 =?utf-8?B?VmJFUHhpNzFQVWZrMlZ0S1hGU29CRk5qbGc2dnNicGx4Vlp5czNhMXkzeE5G?=
 =?utf-8?B?cytxREpENVRETi9wc1dNM1pOcEE1Mk8rN2c2REVFcDd4Qm5MQlF1eVJEWEI4?=
 =?utf-8?B?Y0hZTkEwSzRkR0tzMGFJR2FLclBoUVdVSEllR0dlVjRHVTc3cTNydllLNnRZ?=
 =?utf-8?B?MkQweFpxVW1WQlZweUpKTTlYR0hKbi8vaTQybFFxMVBxd2JiYllaRUh4Vzlw?=
 =?utf-8?B?RkRHY05WbUJ3Y0M0TzUxTWpHa0dVdXlQcXV4cThuTmh4VkowVlAyWi9abS9B?=
 =?utf-8?B?K0d6TGZyN1ErK3p6VlY0TzNpZGkxbVYxOHNQRnJMdWw0aXEvaUJKSHcrUFBT?=
 =?utf-8?B?M0VaOUZ1b1hldWI1b29WaTU1Nm1TY0toTUdTVngzeHR2NXluQUg3WE1MMnZC?=
 =?utf-8?B?UnM4TlFxNXpMb3c5RjZLYys3ZUxDKzl3SHpOUVRMTVBuZjN1KzF3VFpDdlNt?=
 =?utf-8?B?eUMwbDJwei9PWk9jeXNGcWxrano1VHVpRG9hdjdNMUtPam5MSzJ0MysvdWNv?=
 =?utf-8?B?RW54VUkzVmdYMUhWS1VRRVFuc01MdXB5dE9BQ3hvRGROQzdwR1NIK2JKUTRD?=
 =?utf-8?B?aTRQVzkvN2NmZzdkeXBSWWNiQnRVTnRRRGMyVkJjcWJsc1ZRMExCUVJ0YTBl?=
 =?utf-8?B?UWFDMFh2dENyNEFPam9iSHRUaWlOYmRrWjNWYjhGdklXVVBDSGpEVk5yV3Zn?=
 =?utf-8?B?dm1mMXdEbGhDazgwanlNTllXNXVUVEdqbzNIemtkcG5sc0RZeldueGFZSU5t?=
 =?utf-8?B?WWlzVEZIU0JQTjIxR0RHeTg0NlBSdEhhSWFmcWQ4OUJLZVZtUVBBRU4ySE1B?=
 =?utf-8?B?SFQ5M1d1YWQ4SU5TZCt3cjh2aE83QS8vbTJBOER5ZCsyczlhNG5Od2V5Z1du?=
 =?utf-8?B?d2ZXN3JjUzJkejR1bEV6dXoxVWFIdzU2VGI2RjJkYzhIWjJIMWVaVVBBaHhL?=
 =?utf-8?B?ZVhaK1ZMeXo3cUJTVHE4QmtqTGdnT3gyZ1hxL2loQ2s2SXZvZmN3WUlsZWJh?=
 =?utf-8?B?KzhwWWxiMzZRTWtXRnlXU2w5eFlQTTVhSWtYaHVTU3FkVTRpb3NZVWE4T2U0?=
 =?utf-8?B?MmJPbXFXVTJIRTZNNFhEWDlTeEEzelFFRjBkWTNLcTRDR2tLb21wUDRKMlZL?=
 =?utf-8?B?c001T1RJUWNlWERueGdCZkFmdWUrTXdxT1lmRTg5a2kwa01TUkFuTDI5NVc5?=
 =?utf-8?B?MmdMNG1BRlBnZFBYdnRGbFdpdzJBelFmWkd5UkdzbnZVRy96eEltUzIxY21n?=
 =?utf-8?B?Y3ZvWG9oRTk4TnlKT1V0QWJWaVJqVTZyWlhkTUJSSlVZdTVOaUtWemFVcWxx?=
 =?utf-8?B?Ti80QWo3RFQ5WVEwNTY2RUtGRG9LZTBleGg5U1NiUS8rTFdvWGI5QUR4OWN5?=
 =?utf-8?B?b0hBY0kyQVVDOWdmMmpiSzh1TjhMVExSRW93UlhWWXZ5RGZSbmp0OGhRajJz?=
 =?utf-8?B?anJrS1dTTFZhOEpSazB6ckgyNXdaY0JFVG5iY0FsRC81RndPTDhYckpPZ0Nn?=
 =?utf-8?B?bkdvY1VselpFTlhWR2ZEMUxhZTFFQzF4QW12bXNqQ29JY0l4SFZENmJpdkwz?=
 =?utf-8?B?U3RHcmpaYUpjTGhBUGVpakZGc29iOFhhaWE2U3RicEVlOGVoUFEreUg1LzFH?=
 =?utf-8?B?aWpUZzdtV0h4akVNRE0zRTFkZXRsd3htV0hSUS9MNlZTNjZJSkovd0ZBeU1j?=
 =?utf-8?B?VEpHVlhKNlpTVHREaHhzM1E4ZWR1d0RiaWcwbWhTV01uVlptSHNKdmhhSkRL?=
 =?utf-8?B?NWtOeDFzLzRyYUZSZU5zZTBSVzFhYWZ3NWxaai9aN3ZIMlQwSDJmU2VuZFNM?=
 =?utf-8?B?bzRaV1lkUmUzbXR3OVFRNFdwaEswNHZaYzJORkNvayswcU9iTHNHanhtNVZx?=
 =?utf-8?B?RFZsaU9PcFhPYzlobEtBb0RkUVFjNGJQS3cvZEdwalBkZkozMHhiaDNIbXpt?=
 =?utf-8?B?c0RvTDA0SHhzZ3NncHU4ZVF2dTYxbWFZdGJKQzQwNFNQK3BObFR0bjRnY3V6?=
 =?utf-8?B?ZE1iMEdaNVdWeTlGQ3JWSzE0aE5mOWpqU3JyVUN3VkVySDgyR3ptd2cxK1hI?=
 =?utf-8?B?Y0p1WHRYWmpyS1VTeXpvYTJKZk5qeThLUXRPN2VsSWxkN20rdGxFRFkzUTRw?=
 =?utf-8?B?S2IxNFJLWVovWTM0QlQ2OGU2RkVpQ3ZER0M3V0NIZmo3OHk0U0hpUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf7e772-fc3d-40d5-5292-08dee67435dc
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:33:12.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gcep0H0uVXdeaOlX80ubquhSQf5j/QzJK9tYSjp0eaIXpoPxKsbCu7KRYXzioSPXCGgVsiHU8yo7oh7bBMCAYVI10TmkVpLZuRuKAqtquU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jul 2026 15:33:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10097

Hi Robert,

On 7/7/26 8:17 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i can add an entry but i'm not sure of the best explanation for it.
> would someone like to suggest one?
> 

It allows to deploy kernel artifacts in a subdirectory in DEPLOYDIR, or 
am I missing something?

Cheers,
Quentin


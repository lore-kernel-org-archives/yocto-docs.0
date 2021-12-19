Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1693CC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 01:48:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.12574.1639878497905365824
 for <docs@lists.yoctoproject.org>;
 Sat, 18 Dec 2021 17:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aqJFHFyr;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7987cf9f2c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BJ1mEti003097;
	Sun, 19 Dec 2021 01:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+CTvckOJKu7gcqUgR6O53/0nlBAOmQERxxRP6S+yGbI=;
 b=aqJFHFyrFEV+hepf91LfFa4gfKuGy/5kITi6AoOxyu/55dBCGTdlX0XZPa79HJosBEn/
 e/BCGWpSmisciKwm6UKOrH4mjtL3JgGqLOjJ8nPUW70LVqTIPWOfd9xwwRLe/BX1pkI/
 3FqTgvmwC2WKYdRZqTIUqN7iE5M2+NaSotTMYEGFh4jDlJzYYIvqoFKjT2zk1Hv09Y32
 UX6ECHmEqG1ZaA1pWmBG2OufsHIDpSdl8wGke5gjiZHVejCMyO45O8v9RxmJ+NUmo+IL
 I14VjalSDXFuCY1RvF6FmBJaerXzW81OGTGT+HhgKuuv+ulTtE6g0FPmSzLMjhkcyVjT Dw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d16m6rj9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Dec 2021 01:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5zinXAhfPkNylyOvy3j/8jE7F+DVxossHPZAHsZd2oCO0D3i9aZgoGyXCOubH41RsDAJEd8fFh9RdISWgJFnLmsh9nASGN3oBZ1dJsV36XoSCurGJmgY/c7FyGlvSVEaSkbBzgoGe6Kl617xoVS/re8AIP1Q4+ghEgtQLVxr1MhrHTc/pLROUQplkLBFR5svOUsozB7JTJd1SRFPWtAHkS9bz70/u7aGsVtOZuakNLvIeSNb7G0Ks495HD4rJPPhfmO/9bAtIq4y3xE9+Uizv174hhwQ9zguAKEBcdLryEwUpWEq4G1Jl5ENeoVUGZlNK6eYvlP2nrdN7FvhhXS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CTvckOJKu7gcqUgR6O53/0nlBAOmQERxxRP6S+yGbI=;
 b=YyKUwQiVLi4GNosVRakYcEdYHPeH7lj4bfkPT6Zs7koKuWJal6oPlLrKf80nLtaAGWQaPXc7YjU3rKFJx688hjN2b1c8hfVbXnqHk5UkkhHrDLaQncfniyB4c5Fy0Nu2RA20kU7aiNA609zvtfyXHNEl/3U4P4kEBaVi7ZH/hUat7/gSZ2FoQMayPbH8sj18JecUj6r9H4mryiymylabP7QFRHzrKPt8JNAb+IU9lGvs2djGvdOAOkfHZG9ZaSDD9M5TNenyPehKfpqcdhwYBC+BIIds5/n68eO8L69hLAb1uJzV3l816RaQo2/lJjMFoDo5aa5r878Ss0iY5ZXUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3803.namprd11.prod.outlook.com (2603:10b6:5:141::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Sun, 19 Dec
 2021 01:48:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2df5:9c7b:a045:37d8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2df5:9c7b:a045:37d8%4]) with mapi id 15.20.4801.020; Sun, 19 Dec 2021
 01:48:11 +0000
Subject: Re: [docs] [PATCH v2] make the documentation a bit more inclusive
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20211206150401.30444-1-foss+yocto@0leil.net>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <67b196ff-f1aa-6ec2-711c-ed47b9b4a461@windriver.com>
Date: Sat, 18 Dec 2021 20:48:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211206150401.30444-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 228b3036-acc1-4121-41b3-08d9c2919d1d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3803:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB380333C8E7F39E89E77CCAAFF87A9@DM6PR11MB3803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lCU78hZyXieWQelOx6oPqLbsQyjf7m/VtdaiPmJhF9FGwD6BpEpE8DGbg99jDjEjvFCpfWjLBJg3u1jVFrW3humsou+C6iez1T411Z+Y4XkOBEjkdPxbX8vr3fIVRlHdw5kQ53adudsZT2/ELRmVnRfbKsnzWsiuaV3WkPANQXBO7yXTVQUylVrDlG8GB+TrbBLP/O8ad9mHw838vBVpEFM+whBv8c16O6bgZOvwFmwUO4tfPtL7UXLZ6cn8b1C4Qy+paoKyBkKi4OAIw27i9hODBYJQnZ073Hr/3lWcjwf+ORR87KRQfnK1Jkv5Qod6PrE3YuBs5rvDRm2BjZonRDHlyQ6AqckwHhBrcdTJyBr2c6o2+hv2KXb6t9Ml9AVbuYn2EQG4rDblkKZjKHHJZ29LsbxStpltenfT2t0cxxGBHzh1r2e9Jl0HhHJYGgWduoAbQ6zY5uUD2a2RF0XukXmGzjHAIzSMlZSAHj9sMAtJbSxZILl6END+TbcFm1pS6liKBa0yao7obcPecYSfexN96/0bf2BQZaoJ3qZrkx898pFES1J/zw5mite2+uW/HwXuZFFgyMXwS96COwaRpUMrwBa/j2iCwr37/pJmbccEG129KYTz2GMtg85ZufHcFuxlQKgAdErt+i3j2TxOPBNcHYHVuzZIMvkXA93LiMYw8tOVjAryHPzdj1THE4S3EDjxwWIV4Vsr+KxRDJpzU+kwAX++4NvLHZARegXHf6BPcnGtcLmGGXISsIBHlGT0E6Me5oFMmQWb/eZge7u2/a9c2zZSTxs6/Amk7ozUAOSKh0QjFF2sS+3j8kQU7WIiqRa6xAotIwBYkdE7u3jA8wY8IToA/39HsW0yErrbyy4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66946007)(6666004)(38350700002)(2616005)(86362001)(36756003)(38100700002)(4326008)(31696002)(2906002)(6512007)(26005)(31686004)(66556008)(186003)(6486002)(316002)(508600001)(83380400001)(66476007)(52116002)(8676002)(966005)(6506007)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEE4U2RsNSttMjhXYlJ2UTZubjdNbE5HT3NWZ25YOWJFKzN4blZSY0U2RWZa?=
 =?utf-8?B?VTJFYTJiN3JpT0tlcFNoYXFId28zaHJpK2dGZFplK0lFRERlNGtMUlVrOFFz?=
 =?utf-8?B?dURsNXNyMkFVcHRudVkxSElQUlZLTlh0elNRSWlNMHg0OEhmWnQ3bU1aRWFw?=
 =?utf-8?B?Z2l4Mlc2S1lMbCtKM0ZEeFpwa3RCeUJYcUV1V3J2Tk5YcDhBWG9vMHB2NUIz?=
 =?utf-8?B?ZmpPOEh4bmdEMzlHMlM1SVBEdnlOeGl5Z0FvQTcwTFBUZi81dWt1M3hRSUNI?=
 =?utf-8?B?M29DSzErV2RBMTBNQnB6N2huUitWV2lLRUw0NlZocStRZ1YyeUhRUHpNVlZq?=
 =?utf-8?B?b0J1eDVSd1FNK1loUUpDT2RzZ08vNDZhbkRGSlVIWXJXeEFWbmdKTVl1dmkz?=
 =?utf-8?B?T1dCSDlNdGVXMzBQTmZKaFhCYmJVS1YyV3U1NFNjQ2QxQ0tDSWZIdzZEK2Mw?=
 =?utf-8?B?UlhWbjRXM2MzMk12dXR2ay9hZlFaam9JZDNOZVBaS0poVWsyZUhMRGJBNjh5?=
 =?utf-8?B?dGQ0a21sOVdrV044Y0Fhb1IxZFFoYUU3a2tHY0h4TFZoalViQzVYMitJd1pC?=
 =?utf-8?B?bjBWYWlNZkNvci9Yak5wbTg0TjFjWVpBY3Nha3Zkd3FGVjFMcXE2alJkaWRN?=
 =?utf-8?B?TGowdlUzZ2c4dldzNWZSTnUvMW9qVVYrc3hLQmZkUXNCNXE4S1JNR044SlMr?=
 =?utf-8?B?N25FallVWXpQeFZGWHRmZlpGTExLTkhWT2NLcy90cXd3MnhEQ0NlTG9GeUE2?=
 =?utf-8?B?MTl5NVlsL1djaVlrZSsrME95U05NT0k5ei9qRWRhY3lXL0tNYkNFaW5UM3lp?=
 =?utf-8?B?NC91UjBkdzc3TzFYUmpZbkJmRTBzMmxDaFplb2IxYlN1YnN2MXQ2aG5NRC9x?=
 =?utf-8?B?dFJXZFRUVFFTTVVvbUIyZjNrN2Z0MHA2cVlSanNPUi9CS3hCc1J3L3dNajZQ?=
 =?utf-8?B?YnlWQmVJOWhHVTQ2eU9JN3NEMDhsYjFmNlovQk1PVmRYS2NiL3pEMUpoRW1E?=
 =?utf-8?B?SUM0aTZ4QUFNQk4zbm4rZFQ5SGdRdjdybWlKTldoY3FhelpBaitSLzlkMW5F?=
 =?utf-8?B?dzAzY3BkVC9uZHpVWWFLck5yKytZTjRBR0xpM2ZkaktQVEpXR2Z5SkFBRUd2?=
 =?utf-8?B?OW96Q1RIeWRKZTlwb3pYeHg5dHNhdElwYnlxMFZMWFh0M2NBdXZtR0JLb2RB?=
 =?utf-8?B?a0F0ZXBKMlVtaWhGTXAvUWZTQVRWVk9SSTQrdGJPUXNqUXpiWUtrUXIxYUMy?=
 =?utf-8?B?SVQ3cThxSDRYK2xTeXE2RmNqdllNUUgvRVRFVFhPMkJFaEtsejgzQ01sdThY?=
 =?utf-8?B?ZTdiK204ckVVWmNTS1J6eWE5dFordmlsb3NvQXdCdTRTU1JoSmM1a3B6UnR2?=
 =?utf-8?B?enF3OHJFdjNWVDQ0L1Q4QnQzaFNCaERIYlJNV1NnMU5vNGtUQTkvOXE3Tk1u?=
 =?utf-8?B?NmlJbmxmdm9peXRzamEwekNIWHVKK3liV0p1TkVDZm9LZmhPTTRZZ3lUaFVr?=
 =?utf-8?B?Sk55aElWZFNyN0hYVnI2K2tuMVB1dU9yb2lXcTVISHptenJOL1hCUGxEcjNq?=
 =?utf-8?B?U0lMQkpySXFyV1dtYXRzY3dvR0o3aUs2akk2TXNTV2s3dmN2Wi9LelZkTis3?=
 =?utf-8?B?VVZ6R2d3V00vc3JnY2RySnJRL3JXNGtyb1M5TXUzMTdSdklJTXVrZTBoeHFP?=
 =?utf-8?B?bysvWFgrNnBucXlvNXVXNkN4NzdSZ1pwL3VrSnNrRzlCbmNHWk5Ic1pxRWdP?=
 =?utf-8?B?a3dYRnVub1B3TUs5ZnNYNjJUWFljNjVVdHdYdjVENUtSdVZhWUxMdm5YaHh4?=
 =?utf-8?B?cVQ3Yk1GdDZyS1VCRmluVnlFNjB6V29aNXRjRDNMS2VpQVFOdi9QZDJxYWpG?=
 =?utf-8?B?Zy8rYkZVY0luUlhVT0NRT2YzNzBpUHlGeFJnTE5jWEduODhmaXlCZXJtT01z?=
 =?utf-8?B?bzBydmRNY3dSLzZ5M0RaWElINko0dDlTYjNuKzRUYjRDL3BWb2s0ampCb1pL?=
 =?utf-8?B?Tmd4RFBLMXZYVE1zMlREOTdkaGtRN2FRdDFTUWdGN24wZWZncFNUN3E4N25B?=
 =?utf-8?B?ZTRJRmgvZGRZTDlNSytBeVlEczhGdzl4UEZuOGRFWlVRRkZzam5wU2xLSVRU?=
 =?utf-8?B?RFZBRk1FeTBsY3dJZU55Q1VueW1GVVpiRUJEaWZyMnhqa2xZWWl0KzUyNlpV?=
 =?utf-8?B?RHp6a1NvdnNPZlZGemNBR0ZHamhKZE5wSmwxeWNkNHd3dGdQcU5qUk5CMzNa?=
 =?utf-8?B?UUkyUmlBMWN1ckE1WjY2aml0OTh3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 228b3036-acc1-4121-41b3-08d9c2919d1d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2021 01:48:11.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SipaN8w4urv0WRJDIu9lXMPAasGg3VErFj2DOdUrgvu0HdACcoGzP8CNfsg5LbNqGVZI6zvxPlvWpt0bQdP6SesHVffwjU+rOXc+csBVHzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3803
X-Proofpoint-ORIG-GUID: g4_2RfyrYpwDevAqvYYFsDM85tAzpnzU
X-Proofpoint-GUID: g4_2RfyrYpwDevAqvYYFsDM85tAzpnzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-18_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1011 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112190008
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 19 Dec 2021 01:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2315

On 2021-12-06 10:04 a.m., Quentin Schulz wrote:
> Except the name of variables which can't be changed only in the
> documentation for obvious reasons and workflow or developement
> explanations around the use of the "master" branch which cannot be
> replaced with "development" branch instead, most of the non-inclusive
> words that appear in https://inclusivenaming.org/word-lists/tier-1/
> should have been replaced in this patch.
> 
> Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
> ---
>   documentation/bsp-guide/bsp.rst               |  12 +-
>   documentation/dev-manual/common-tasks.rst     | 159 +++++++++---------
>   documentation/kernel-dev/advanced.rst         |   6 +-
>   documentation/kernel-dev/concepts-appx.rst    |   4 +-
>   .../migration-guides/migration-1.6.rst        |   2 +-
>   .../migration-guides/migration-3.3.rst        |   2 +-
>   documentation/overview-manual/concepts.rst    |  10 +-
>   .../development-environment.rst               |  45 +++--
>   documentation/overview-manual/yp-intro.rst    |   2 +-
>   documentation/ref-manual/classes.rst          |  14 +-
>   documentation/ref-manual/images.rst           |   2 +-
>   documentation/ref-manual/terms.rst            |   2 +-
>   documentation/ref-manual/variables.rst        |  39 +++--
>   .../sdk-manual/appendix-customizing.rst       |  11 +-
>   14 files changed, 151 insertions(+), 159 deletions(-)


I think it would be better for reviewers for you to submit these changes 
in smaller patches.
Could you split this up into one or two related 'inclusive words' at a time?


Thanks,

-- 
# Randy MacLeod
# Wind River Linux



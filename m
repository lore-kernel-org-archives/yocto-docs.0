Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.77])
 by mx.groups.io with SMTP id smtpd.web11.5925.1631703576299090402
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 03:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=B1zY3o9c;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.77, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uvf11vh+MJXe5MIoRyQlP6t3FuHigvL57JJGWRZsPeZAzZ2D8P3S8pMfOQQNFNrsdismPMi5Sg5HZ71QVA12ms2whQTPyHbU+AZcvlnysC37wlv+JgZl6kdvxGdBzTiQuxFrNFfIGBs6EiyylmuMmmfK8Aet551TMW5cA+lx88TLJC7FVTkQVbV4y10g+CJtv4lwfr6WQ2g6oVBfhbSV2m11BT7VC5OYnmYRBhNqV6S9lqNSuzS1DM8EScJ+g0VJ/feAevwHZTV8DwMexRM5aJZS3XpakW9bY8aMuvquiISStZiyXXaTM6U6BQjE55MjBLehEXvGMjvYJykU6UwF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vokCtj73iJi73n23F2dURP+tcy6SWcETc/TvFJNVgns=;
 b=kOylVqe/CQz/cRku2J3RUI2mKsqgIEvI3HFH0QXsvuUW3c30MhfSs2Lv7W7saPNd1JJMoIhLP4pm5MExA5tV9AdNyXF7vGxONlOQiU8kCFrmiUfzYwxJiM35jagOwECma10dj2+qXSD/lD++VJ1sVqS2ISBeRqRXrrndxDZ8nWw9VUR0d38r8eiIwq0L8ydh8bZSdD+YGL+xWUMT40eH4wt5uhkLqObh+3lCPVAi2E20WmM5nyRJIOuJOzPPQMvjpm6hD9SohnR5ystv0pGAHkCafAjGGGmolgAtnOuBXeG9YsAEXvp4MydVCMWdzp2VJqPk6YeMSvseO0J1sosfDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vokCtj73iJi73n23F2dURP+tcy6SWcETc/TvFJNVgns=;
 b=B1zY3o9co4KhCz7ksURlkm4Sqw05clc39BtrcbVRERCXjywuYkJodowt7J8zCN2BzmBVltUqFrcWmS5otRlec0JZraCjaMNsdbGCDHq9sAcSYzZ9bh6C+47hEEPECp1f7q5/rS6yOTWhfVqAtMhhgkJLlqdO6YtTU/POYS1Tkaw=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 10:59:33 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 10:59:33 +0000
Date: Wed, 15 Sep 2021 12:59:31 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: delete unmaintained history sections
Message-ID: <20210915105931.yonsqyxkb67ytjim@fedora>
References: <20210914145930.371537-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210914145930.371537-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR0P264CA0073.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::13) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0073.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 10:59:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9141367-d787-455c-9d94-08d97837e69b
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB794005F63DB119F3D143E445C2DB9@AM8PR04MB7940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pRmYohq3EPA5Rz1pTFzrRWQ3DCMkcDwNruZhot0QaGwFL94lCrhz7wix6bkwP5AR+K/vkGwvig8huYF55maBEzRR2zAiyc6Bs28WsdTATU6OvtZ3NTYCMLs5WcknowcUEgWdTcRvI7KERulaOohkA8ZPVJ+KDwgdHkFnZnEUcMnu+yOJzHz/O5E1dWtlbKWaIuKIdTswVCbT6r6qzIJeC1N+Clo1Le0eqwD7dJpuHqiZcC2R48LSZbEVM467aq/kJKjUKFXQRNZ5+EUbWjwDkDYpMQsebRYpkuei1Drz0J36Sg4WCobpNDlGFBAZBxLWtltDm0yl7xrckhA4poYmFQGRAKoqrTDJK23Q2FpRwgnQzoDPGnzSa7q0h1qme3UnAruvjkGFD0ZNkk/AKcHDSjRndNRKs17+/yfTTMqXyUbt8gCUPie0ssKkcLYEOXeQoc2Ek7Syb9arnuXClhhMEd6El2gK2/zEzvdnExUC8ZdJfqlt28k4dOLAtnRZxa0BJdTWEcuv1/biDCpoU/OgZYDfQ5KwS8i4OC0x2ZAGATdCeyqSReDrJV423f97+VSU1426AhvtFZXZJHTZNNb81L3hTB/uTmvKM4PWhLyNnjI/bAOWHDur421EYjYgVYMHOLcjn9rEfaYBxoVuSVwzKvCwLA02yUrKs4cs1O1t6dWilFpffI18ANVB6FZBWmKgn4Hp93RK0z+IP+CZTKLtOtu9LRqKJsl7YvCM8NUQsIT7j/YukJEKqyZ5i7J2zy4cC4UMLyU7vJ246jjZSdZ/NaHr1ttVuR/RNcbfKwrbRSA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(39850400004)(136003)(366004)(9576002)(478600001)(5660300002)(44832011)(4326008)(66946007)(26005)(316002)(1076003)(38350700002)(38100700002)(9686003)(966005)(33716001)(55016002)(83380400001)(8676002)(8936002)(86362001)(6916009)(2906002)(956004)(4744005)(186003)(52116002)(6496006)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DilT2+SJ3SxCwi+Ljlq4LSP3p9/QwfdqbU8CeiqoWhFyObaZLu18hbl1jdrN?=
 =?us-ascii?Q?qx/fTYxzSM2iCJOVnxBhtHuqFnlDDlAyhiLLab/Is1dbYe+QSdmPjXkqJvNp?=
 =?us-ascii?Q?MMtg/87kXVdZcX9lFpQgknR6dUP/sJop5vV/dhNSSZvuMHB4ygFZI0uSfJTM?=
 =?us-ascii?Q?yEYx5vYFLEolg0//Gzc6L5chR8Nia4KuTz7f3/DcgX2/rHJftir6EMA4iavz?=
 =?us-ascii?Q?fIqTcqy5XbRHMxPwVgX8L/S5ZfOeT4eocJcERtGzi2b/O87s4r9nkY3gHTv/?=
 =?us-ascii?Q?2JyR68uZ6lLJ6YOBxXa8gCJh0gu6ynCsF2X6PQzyWCHpFedRhw57FkG/FT/D?=
 =?us-ascii?Q?10eX0pxPxyyL4LBFrLF+3CMV269TEdAABDgDiO1+KQZl0FaoowfiTcb+4GBf?=
 =?us-ascii?Q?RIO60qAvs43hd4a4SuE6biIk+xPfbng0aB5FSS05Fzpu+diHnIufpfMWUpKd?=
 =?us-ascii?Q?A7zj08rzaxnbRYcdQ9VaYwA11IWSA/jepKHVuVkIixHTZTF5KvFuGfoN8CqI?=
 =?us-ascii?Q?916kqPBb5oVpPpmT8Dc6l/4Rnj7zp3/O3OlNQfbOtCiaiczB/wGNMB/kLLO0?=
 =?us-ascii?Q?74+Ln3VceP3V+hA+yVgqdd8U1zYLXYBM7EBklcAbYPjyTFUtL6zJuO6fI0Ti?=
 =?us-ascii?Q?C16rNO89OnbzVJlVgKY4GSCZ6+IVAUR0+Uj5eSW3Bol0X4dYDZKOx6g7flFs?=
 =?us-ascii?Q?hPtCyLakYQF9TOuEtGeiMX/g/TkS+1EX/cnHhMZsKAVoGJqLmVmGLJ0E4VUF?=
 =?us-ascii?Q?YL3/6cIxZGtAiW3pINiMJeELFUuccHuD2YGfwct6+nVg/olqQwvz+McJ4Evh?=
 =?us-ascii?Q?qgTirxJ81CAAwjKmXiUV9WJuNDmnigAo777S7ELRo7ZaddODtovUSTfOoLMn?=
 =?us-ascii?Q?zgMMehmrHIxjPTYbVa0gI82fL8NQw5Xbu5xswl8trN+O+XKNRHG7hU0xfEvi?=
 =?us-ascii?Q?RyRVENE39rk06/JiVz57+fnzYRtVOwVaXl2rl+Aeeu/YCzeUo5e17BUQuebQ?=
 =?us-ascii?Q?174cAavla3fEFUQV3MJjoYqp8eetYFBPW0dOmwCNDFt8+oT2VFMuCiIrEl9v?=
 =?us-ascii?Q?3zbxVY12PnCFT2w4s1siQtXnp61kQyBBdHVprx+OQBTNVtgk7xdZuU5Igc82?=
 =?us-ascii?Q?x7pRgI2+Xhbw8xYxLsrqu+9hVqT4kf/I6V3fB3EGVLIjsgjux4d4HmWERE60?=
 =?us-ascii?Q?Zc4+NVozCJ7CqqEw2wIQVG7VehdOzMpNtjaiJlaRJOdSte9r8ZFuq7jIImsx?=
 =?us-ascii?Q?ZVhlltKPHS5Zy7BI6m/hMhP7za4Mj+09/JUuQyU34sgiwky5/B2uKygtV9Tz?=
 =?us-ascii?Q?KHpSqdgHGbZK+QIpNU7E4CT2?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9141367-d787-455c-9d94-08d97837e69b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:59:33.7957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST8+PrIW3Zpz6Kjr86wO9MgiuWisdbirdvu/lqvz9JMjDOxs6SBWsLNIrXhD2E01Vt3a/gsYQb7hLmhxQeCPgxUTsotMsTKBbqoLn8qpu+oWDEZGaHKKdsjhqftU2f5T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Sep 14, 2021 at 04:59:30PM +0200, Michael Opdenacker wrote:
> This deletes the history sections in each sub-manual,
> which didn't add any value, given that they didn't list
> the changes from one Yocto Project version to the next.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I think it would still make sense to have this information somewhere in
the docs, to at least highlight how old the release you're using is.

Something like:
https://wiki.yoctoproject.org/wiki/Releases
but in the docs.

I assume we would need to handle this docs.yoctoproject.org wide and not
per release as otherwise it'll fall out of sync again.

In any case, just food for thoughts.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Quentin
